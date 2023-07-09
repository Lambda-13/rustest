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
import { createSearch, decodeHtmlEntities } from 'common/string';
import { logger } from '../logging';

export const ShipSelect = (props, context) => {
  const { act, data } = useBackend(context);

  const ships = data.ships || {};
  const BuyNewShip = data.BuyNewShip || {};
  const templates = data.templates || [];

  const [currentTab, setCurrentTab] = useLocalState(context, 'tab', 1);
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

  const [shownTabs, setShownTabs] = useLocalState(context, 'tabs', [
    { name: 'Доступные суда', tab: 1 },
    { name: 'Приобрести судно', tab: 3 },
  ]);
  const searchFor = (searchText) =>
    createSearch(searchText, (thing) => thing.name);

  const [searchText, setSearchText] = useLocalState(context, 'searchText', '');

  return (
    <Window title="Войти в игру" width={800} height={600} resizable>
      <Window.Content scrollable>
        <Tabs>
          {shownTabs.map((tabbing, index) => (
            <Tabs.Tab
              key={`${index}-${tabbing.name}`}
              selected={currentTab === tabbing.tab}
              onClick={() => setCurrentTab(tabbing.tab)}
            >
              {tabbing.name}
            </Tabs.Tab>
          ))}
        </Tabs>
        {currentTab === 1 && (
          <Section
            title="Активные суда в данном секторе"
            buttons={
              <Button
                content="Купить судно"
                tooltip={
                  /* worth noting that disabled ship spawn doesn't cause the
                  button to be disabled, as we want to let people look around */
                  (data.purchaseBanned && 'Тебе нельзя приобретать суда.') ||
                  (!data.shipSpawnAllowed &&
                    'В настоящий момент отправка кораблей ограничена.')
                }
                disabled={data.purchaseBanned}
                onClick={() => {
                  setCurrentTab(3);
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
              {Object.values(ships).map((ship) => {
                const shipName = decodeHtmlEntities(ship.name);
                return (
                  <Table.Row key={shipName}>
                    <Table.Cell>
                      <Button
                        content={
                          ship.joinMode === applyStates.apply ? 'Apply' : 'Join'
                        }
                        color={
                          ship.joinMode === applyStates.apply
                            ? 'average'
                            : 'good'
                        }
                        onClick={() => {
                          setSelectedShip(ship);
                          setCurrentTab(2);
                          const newTab = {
                            name: 'Выбрать профессию',
                            tab: 2,
                          };
                          // check if the tab already exists
                          const tabExists = shownTabs.some(
                            (tab) =>
                              tab.name === newTab.name && tab.tab === newTab.tab
                          );
                          if (tabExists) {
                            return;
                          }
                          setShownTabs((tabs) => {
                            logger.log(tabs);
                            const newTabs = [...tabs];
                            newTabs.splice(1, 0, newTab);
                            return newTabs;
                          });
                        }}
                      />
                    </Table.Cell>
                    <Table.Cell>{shipName}</Table.Cell>
                    <Table.Cell>{ship.class}</Table.Cell>
                  </Table.Row>
                );
              })}
            </Table>
          </Section>
        )}
        {currentTab === 2 && (
          <>
            <Section
              title={`Подробности о судне - ${decodeHtmlEntities(
                selectedShip.name
              )}`}
            >
              <LabeledList>
                <LabeledList.Item label="Класс">
                  {selectedShip.class}
                </LabeledList.Item>
                <LabeledList.Item label="Статус">
                  {selectedShip.joinMode}
                </LabeledList.Item>
                <LabeledList.Item label="От капитана">
                  {selectedShip.memo || '-'}
                </LabeledList.Item>
              </LabeledList>
            </Section>
            <Collapsible title={'Подробнее...'}>
              <LabeledList>
                <LabeledList.Item label="Описание корабля">
                  {selectedShip.desc || '-'}
                </LabeledList.Item>
                <LabeledList.Item label="Теги">
                  {(selectedShip.tags && selectedShip.tags.join(', ')) || '-'}
                </LabeledList.Item>
              </LabeledList>
            </Collapsible>
            <Section
              title="Выбери профессию"
              buttons={
                <Button
                  content="Назад"
                  onClick={() => {
                    setCurrentTab(1);
                  }}
                />
              }
            >
              <Table>
                <Table.Row header>
                  <Table.Cell collapsing>Войти</Table.Cell>
                  <Table.Cell>Название</Table.Cell>
                  <Table.Cell>Доступно слотов</Table.Cell>
                  <Table.Cell>Мин. наигранное время</Table.Cell>
                </Table.Row>
                {selectedShip.jobs.map((job) => (
                  <Table.Row key={job.name}>
                    <Table.Cell>
                      <Button
                        content="Select"
                        tooltip={
                          data.playMin < job.minTime &&
                          'You do not have enough playtime to play this job.'
                        }
                        disabled={data.playMin < job.minTime}
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
                    <Table.Cell>
                      {(job.minTime > 0 &&
                        (job.minTime.toString() +
                          'm ' +
                          (data.playMin < job.minTime && '(Unmet)') ||
                          '(Met)')) ||
                        '-'}
                    </Table.Cell>
                  </Table.Row>
                ))}
              </Table>
            </Section>
          </>
        )}
        {currentTab === 3 && (
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
                    setCurrentTab(1);
                  }}
                />
              </>
            }
          >
            {templates.filter(searchFor(searchText)).map((template) => (
              <Collapsible
                title={template.name}
                key={template.name}
                color={
                  (!data.shipSpawnAllowed && 'average') ||
                  ((template.curNum >= template.limit ||
                    data.playMin < template.minTime) &&
                    'grey') ||
                  'default'
                }
                buttons={
                  <Button
                    content="Купить"
                    tooltip={
                      (!data.shipSpawnAllowed &&
                        'В настоящее время отправка судов ограничена.') ||
                      (template.curNum >= template.limit &&
                        'Слишком много судов данного типа в секторе.') ||
                      (data.playMin < template.minTime &&
                        'У тебя мало наигранного времени.')
                    }
                    disabled={
                      !data.shipSpawnAllowed ||
                      template.curNum >= template.limit ||
                      data.playMin < template.minTime
                    }
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
                  <LabeledList.Item label="Тег">
                    {(template.tags && template.tags.join(', ')) || '-'}
                  </LabeledList.Item>
                  <LabeledList.Item label="Среднее кол-во экипажа">
                    {template.crewCount}
                  </LabeledList.Item>
                  <LabeledList.Item label="Макс. кол-во экипажа">
                    {template.limit}
                  </LabeledList.Item>
                  <LabeledList.Item label="Мин. наигранного времени">
                    {template.minTime +
                      'm ' +
                      ((data.playMin < template.minTime && '(Unmet)') ||
                        '(Met)')}
                  </LabeledList.Item>
                  <LabeledList.Item label="Вики (англ)">
                    <a
                      href={'https://shiptest.net/wiki/' + template.name}
                      target="_blank"
                      rel="noreferrer"
                    >
                      Тык
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
