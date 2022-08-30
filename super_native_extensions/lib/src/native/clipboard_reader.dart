import 'package:nativeshell_core/nativeshell_core.dart';

import 'context.dart';
import '../clipboard_reader.dart';
import '../reader.dart';
import '../reader_manager.dart';

class ClipboardReaderImpl extends ClipboardReader {
  @override
  Future<DataReader> newClipboardReader() async {
    final handle = await _channel.invokeMethod('newClipboardReader');
    return DataReader(handle: DataReaderHandle.deserialize(handle));
  }

  ClipboardReaderImpl();

  final _channel = NativeMethodChannel('ClipboardReader',
      context: superNativeExtensionsContext);
}