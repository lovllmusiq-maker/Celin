import React from 'react';
import './App.css';
import { SpeedInsights } from '@vercel/speed-insights/react';

function App() {
  return (
    <div className="App">
      <header className="App-header">
        <h1>Celin</h1>
        <p>
          Welcome to Celin - A collection of web applications.
        </p>
      </header>
      <SpeedInsights />
    </div>
  );
}

export default App;
