import * as React from 'react';
import * as DriveKit from '@react-native-drivekit/core';

import { StyleSheet, View, Text } from 'react-native';

export default function App() {
  const [result, setResult] = React.useState<number | undefined>();

  React.useEffect(() => {
    const init = async () => {
      await DriveKit.setApiKey('jX9ZchNyypeQwi6Gi5TUdkdc');
      const apiKey = await DriveKit.getApiKey();
      console.warn ('API KEY = ', apiKey)
    }
    init()
  }, []);

  return (
    <View style={styles.container}>
      <Text>Result: {result}</Text>
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    alignItems: 'center',
    justifyContent: 'center',
  },
  box: {
    width: 60,
    height: 60,
    marginVertical: 20,
  },
});
