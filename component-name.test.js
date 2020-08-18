import * as React from 'react';
import { render } from '@testing-library/react';
import '@testing-library/jest-dom';

import ComponentName from './component-name';
import data from './data';

describe('Component Name', () => {

  it('renders component name', () => {
    const { getByTestId } = render(
      <ComponentName data={data} />
    );

    expect(getByTestId('component-name')).toBeInTheDocument();
  });
});
