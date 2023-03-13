import { useBackend, useLocalState } from '../backend';
import {
  Button,
  Input,
  Section,
  Tabs,
  Table,
  LabeledList,
  Collapsible,
} from '../components';
import { Window } from '../layouts';
import { createSearch } from 'common/string';

export const ShipSelect = (props, context) => {
  const { act, data } = useBackend(context);

  const ships = data.ships || {};
  const templates = data.templates || [];

  const [tab, setTab] = useLocalState(context, 'tab', 1);
  const [selectedShip, setSelectedShip] = useLocalState(
    context,
    'selectedShip',
    null
  );

  const applyStates = {
    open: 'Open',
    apply: 'Apply',
    closed: 'Locked',
  };

  const searchFor = (searchText) =>
    createSearch(searchText, (thing) => thing.name);

  const [searchText, setSearchText] = useLocalState(context, 'searchText', '');

  return (
    <Window title="Войти в игру" width={800} height={600} resizable>
      <Window.Content scrollable>
        <Tabs>
          <Tabs.Tab selected={tab === 1}>СУДНО</Tabs.Tab>
          <Tabs.Tab selected={tab === 2}>ПРОФЕССИЯ</Tabs.Tab>
          <Tabs.Tab selected={tab === 3}>ПОКУПКА</Tabs.Tab>
        </Tabs>
        {tab === 1 && (
          <Section
            title="Активные суда в данном секторе"
            buttons={
              <Button
                content="Купить судно"
                onClick={() => {
                  setTab(3);
                }}
              />
            }
          >
            <Table>
              <Table.Row header>
                <Table.Cell collapsing>Вход</Table.Cell>
                <Table.Cell>Название</Table.Cell>
                <Table.Cell>Класс</Table.Cell>
              </Table.Row>
              {Object.values(ships).map((ship) => (
                <Table.Row key={ship.name}>
                  <Table.Cell>
                    <Button
                      content={
                        ship.joinMode === applyStates.apply ? 'Apply' : 'Join'
                      }
                      color={
                        ship.joinMode === applyStates.apply ? 'average' : 'good'
                      }
                      onClick={() => {
                        setSelectedShip(ship);
                        setTab(2);
                      }}
                    />
                  </Table.Cell>
                  <Table.Cell>{ship.name}</Table.Cell>
                  <Table.Cell>{ship.class}</Table.Cell>
                </Table.Row>
              ))}
            </Table>
          </Section>
        )}
        {tab === 2 && (
          <>
            <Section title={`Информация о судне "${selectedShip.name}"`}>
              <LabeledList>
                <LabeledList.Item label="Класс">
                  {selectedShip.class}
                </LabeledList.Item>
                <LabeledList.Item label="Статус">
                  {selectedShip.joinMode}
                </LabeledList.Item>
                <LabeledList.Item label="Описание">
                  {selectedShip.desc || 'Нет описания'}
                </LabeledList.Item>
                <LabeledList.Item label="От капитана">
                  {selectedShip.memo || '-'}
                </LabeledList.Item>
              </LabeledList>
            </Section>
            <Section
              title="Выбери профессию"
              buttons={
                <Button
                  content="Назад"
                  onClick={() => {
                    setTab(1);
                  }}
                />
              }
            >
              <Table>
                <Table.Row header>
                  <Table.Cell collapsing>Войти</Table.Cell>
                  <Table.Cell>Профессия</Table.Cell>
                  <Table.Cell>Осталось мест</Table.Cell>
                </Table.Row>
                {selectedShip.jobs.map((job) => (
                  <Table.Row key={job.name}>
                    <Table.Cell>
                      <Button
                        content="Select"
                        onClick={() => {
                          act('join', {
                            ship: selectedShip.ref,
                            job: job.ref,
                          });
                        }}
                      />
                    </Table.Cell>
                    <Table.Cell>{job.name}</Table.Cell>
                    <Table.Cell>{job.slots}</Table.Cell>
                  </Table.Row>
                ))}
              </Table>
            </Section>
          </>
        )}
        {tab === 3 && (
          <Section
            title="Купить судно"
            buttons={
              <>
                <Input
                  placeholder="Поиск..."
                  autoFocus
                  value={searchText}
                  onInput={(_, value) => setSearchText(value)}
                />

                <Button
                  content="Назад"
                  onClick={() => {
                    setTab(1);
                  }}
                />
              </>
            }
          >
            {templates.filter(searchFor(searchText)).map((template) => (
              <Collapsible
                title={template.name}
                key={template.name}
                buttons={
                  <Button
                    content="Купить"
                    onClick={() => {
                      act('buy', {
                        name: template.name,
                      });
                    }}
                  />
                }
              >
                <LabeledList>
                  <LabeledList.Item label="Описание">
                    {template.desc || 'Нет описания'}
                  </LabeledList.Item>
                  <LabeledList.Item label="Кол-во экипажа">
                    {template.crewCount}
                  </LabeledList.Item>
                  <LabeledList.Item label="Вики (англ)">
                    <a
                      href={'https://shiptest.net/wiki/' + template.name}
                      target="_blank"
                      rel="noreferrer"
                    >
                      Here
                    </a>
                  </LabeledList.Item>
                </LabeledList>
              </Collapsible>
            ))}
          </Section>
        )}
      </Window.Content>
    </Window>
  );
};
