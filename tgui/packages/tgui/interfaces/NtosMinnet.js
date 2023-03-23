import { Fragment } from 'inferno';
import { useBackend } from '../backend';
import { Box, Button, Section } from '../components';
import { NtosWindow } from '../layouts';

export const NtosMinnet = (props, context) => {
  const { act, data } = useBackend(context);
  const { PC_device_theme, miners = [] } = data;
  return (
    <NtosWindow theme={PC_device_theme} width={520} height={630}>
      <NtosWindow.Content scrollable>
        <Section
          title="Криптомайнеры"
          buttons={
            <Button.Confirm
              icon="wrench"
              content={data.cryptokey}
              onClick={() => act('set_key')}
            />
          }>
          {miners.map((component) => (
            <Section
              key={component.name}
              title={component.name}
              level={2}
              buttons={
                <Fragment>
                  <Button.Checkbox
                    content="Включено"
                    checked={component.mining}
                    mr={1}
                    onClick={() =>
                      act('toggle_miner', {
                        name: component.name,
                      })
                    }
                  />
                  <Box inline bold mr={1}>
                    {component.hashrate} Sols/s
                  </Box>
                  <Box inline bold mr={1}>
                    {component.temp}°C
                  </Box>
                  <Box inline bold mr={1}>
                    {component.powerusage}W
                  </Box>
                </Fragment>
              }
            />
          ))}
        </Section>
      </NtosWindow.Content>
    </NtosWindow>
  );
};
