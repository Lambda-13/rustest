import { useBackend } from '../backend';
import { Slider, Button, LabeledList, ProgressBar, Box } from '../components';
import { Window } from '../layouts';

export const Antimatter = (props, context) => {
  const { act, data } = useBackend(context);
  return (
    <Window theme="scarlet" width={300} height={300}>
      <Window.Content>
        <Button
          content={data.active ? 'АКТИВНОЕ СОСТОЯНИЕ' : 'ПРОЦЕСС ОСТАНОВЛЕН'}
          textAlign="center"
          fontSize="18px"
          fluid
          mb={1}
          onClick={() => act('togglestatus')}
        />
        {data.fueljar && (
          <Box>
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
            <Button
              content={data.fueljar}
              textAlign="center"
              fontSize="18px"
              fluid
              mb={1}
              onClick={() => act('ejectjar')}
            />
          </Box>
        )}
        <LabeledList>
          <LabeledList.Item label="Текущая стабильность">
            <ProgressBar
              value={data.stability / 100}
              ranges={{
                good: [0.9, Infinity],
                average: [0.5, 0.9],
                bad: [-Infinity, 0.5],
              }}
            />
          </LabeledList.Item>
          <LabeledList.Item label="Средняя стабильность">
            <ProgressBar
              value={data.stored_core_stability / 100}
              ranges={{
                good: [0.9, Infinity],
                average: [0.5, 0.9],
                bad: [-Infinity, 0.5],
              }}
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
              {data.fuel}/10000
            </LabeledList.Item>
          )}
        </LabeledList>
      </Window.Content>
    </Window>
  );
};
