import 'package:flutter_test/flutter_test.dart';
import 'package:sprightly/extensions/string_extensions.dart';

void main() {
  group('Trimmer test', () {
    test('trimming() test',(){
      // arrange
      final testString =
          '  abc ';

      // act
      final result = testString.trimming(testString);

      // asset
      expect(result,'abc');
    });
  });
  
  group('CleanString test', () {
    test('escapeMessy() test', () {
      // arrange
      final testString =
          '  *^#%*^\$#*^%#%\$@  https://www.example.com/path/to/file?param_1=value24%26ffd&param2=heavy+duty (&^\$*^%\$&^\$&%\$) ';

      // act
      final result = testString.escapeMessy();

      // asset
      expect(result,
          'https_www_example_com_path_to_file_param_1_value24_26ffd_param2_heavy_duty');
    });
    test('escapeMessy() test with custom escapeWith', () {
      // arrange
      final testString =
          '  *^#%*^\$#*^%#%\$@  https://www.example.com/path/to/file?param_1=value24%26ffd&param2=heavy+duty (&^\$*^%\$&^\$&%\$) ';

      // act
      final result = testString.escapeMessy('-');

      // asset
      expect(result,
          'https-www-example-com-path-to-file-param_1-value24-26ffd-param2-heavy-duty');
    });
    test('escapeMessy() test with empty escapeWith', () {
      // arrange
      final testString =
          '  *^#%*^\$#*^%#%\$@  https://www.example.com/path/to/file?param_1=value24%26ffd&param2=heavy+duty (&^\$*^%\$&^\$&%\$) ';

      // act
      final result = testString.escapeMessy('');

      // asset
      expect(result,
          'httpswwwexamplecompathtofileparam_1value2426ffdparam2heavyduty');
    });
  });
}
