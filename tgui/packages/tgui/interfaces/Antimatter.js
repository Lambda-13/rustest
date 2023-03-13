import { useBackend } from '../backend';
import {
  Slider,
  Button,
  Section,
  LabeledList,
  ProgressBar,
  RoundGauge,
} from '../components';
import { toFixed } from 'common/math';
import { Window } from '../layouts';

export const Antimatter = (props, context) => {
  const { act, data } = useBackend(context);
  return (
    <Window width={800} height={500}>
      <Window.Content>
        <Section
          title="Управление"
          buttons={
            <>
              {data.fueljar && (
                <Button
                  content="Извлечь сосуд"
                  icon="eject"
                  mb={1}
                  visible={data.fueljar ? 'true' : 'false'}
                  onClick={() => act('ejectjar')}
                />
              )}
              <Button
                icon={data.active ? 'power-off' : 'times'}
                content={
                  data.active ? 'Состояние: включена' : 'Состояние: выключена'
                }
                mb={1}
                onClick={() => {
                  act('togglestatus');
                }}
              />
            </>
          }
        />
        <Section title="Настройки">
          <LabeledList>
            <LabeledList.Item label="Мощность">
              <Slider
                value={data?.fuel_injection}
                unit="АМ"
                minValue={0}
                maxValue={100}
                step={1}
                stepPixelSize={3}
                mb={1}
                onDrag={(e, value) =>
                  act('strengthinput', {
                    target: value,
                  })
                }
              />
            </LabeledList.Item>
          </LabeledList>
        </Section>
        <Section title="Информация">
          <LabeledList>
            <LabeledList.Item label="Текущая стабильность">
              <RoundGauge
                size={2}
                value={data.stability}
                minValue={0}
                maxValue={100}
                alertBefore={100 * 0.75}
                ranges={{
                  'good': [100 * 0.75, 100],
                  'average': [100 * 0.5, 100 * 0.75],
                  'bad': [-2, 100 * 0.5],
                }}
                format={(value) => toFixed(value) + '%'}
              />
            </LabeledList.Item>
            <LabeledList.Item label="Средняя стабильность">
              <RoundGauge
                size={2}
                value={data.stored_core_stability}
                minValue={0}
                maxValue={100}
                alertBefore={100 * 0.75}
                ranges={{
                  'good': [100 * 0.75, 100],
                  'average': [100 * 0.5, 100 * 0.75],
                  'bad': [-2, 100 * 0.5],
                }}
                format={(value) => toFixed(value) + '%'}
              />
            </LabeledList.Item>
            <LabeledList.Item label="Подключённая обшивка">
              {data.linked_shielding}
            </LabeledList.Item>
            <LabeledList.Item label="Подключённые ядра">
              {data.linked_cores}
            </LabeledList.Item>
            <LabeledList.Item label="Активные ядра">
              {data.reported_core_efficiency}
            </LabeledList.Item>
            <LabeledList.Item label="Выход энергии">
              {data.stored_power}
            </LabeledList.Item>
            {data.fueljar && (
              <LabeledList.Item label="Топливо">
                <ProgressBar value={data.fuel / data.fuelmax}>
                  {data.fuel + '/' + data.fuelmax}
                </ProgressBar>
              </LabeledList.Item>
            )}
          </LabeledList>
        </Section>
      </Window.Content>
    </Window>
  );
};
