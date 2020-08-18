import React from 'react';
import { render } from '@testing-library/react';
import App from './App';

test('renders OtherPage link', () => {
  const { getByText } = render(<App />);
  const linkElement = getByText(/OtherPage/i);
  expect(linkElement).toBeInTheDocument();
});
