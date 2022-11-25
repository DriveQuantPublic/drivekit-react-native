const path = require('path');
const packCore = require('@react-native-drivekit/core/package.json');
const packTripAnalysis = require('../packages/trip-analysis/package.json');
const packDriverData = require('../packages/driver-data/package.json');

module.exports = {
  presets: ['module:metro-react-native-babel-preset'],
  plugins: [
    [
      'module-resolver',
      {
        extensions: ['.tsx', '.ts', '.js', '.json'],
        alias: {
          [packCore.name]: path.join(__dirname, '../core', packCore.source),
          [packTripAnalysis.name]: path.join(
            __dirname,
            '../trip-analysis',
            packTripAnalysis.source,
          ),
          [packDriverData.name]: path.join(
            __dirname,
            '../driver-data',
            packDriverData.source,
          ),
        },
      },
    ],
  ],
};
