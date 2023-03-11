import { NtosWindow } from '../layouts';
import { NtosRadarContent } from './NtosRadar';

export const NtosRadarFlight = (props, context) => {
  return (
    <NtosWindow width={800} height={600} theme="flight">
      <NtosRadarContent />
    </NtosWindow>
  );
};
