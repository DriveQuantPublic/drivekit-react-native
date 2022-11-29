const path = require('path');
const pak = require('../package.json');
const packCore = require('@react-native-drivekit/core/package.json');

module.exports = {
  presets: ['module:metro-react-native-babel-preset'],
  plugins: [
    [
      'module-resolver',
      {
        extensions: ['.tsx', '.ts', '.js', '.json'],
        alias: {
          [packCore.name]: path.join(
            __dirname,
            '../packages/core',
            packCore.source,
          ),
        },
      },
    ],
  ],
};
