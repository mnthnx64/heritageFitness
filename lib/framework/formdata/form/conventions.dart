class Conventions {

  /*
   * HTTP headers
   */ 
  static const HEADER_SERVICE = '_s';
  static const HEADER_AUTH = 'Authorization';
  static const CONTENT_TYPE = "Content-type";


  /*
   * Tags or field names in the paylaod back-and-forth
   */ 
  static const TAG_MESSAGES = 'messages';
  static const TAG_ALL_OK = 'allOk';
  static const TAG_DATA = 'data';
  static const TAG_LIST = 'list';
  static const TAG_MAX_ROWS = 'maxRows';
  static const TAG_CONDITIONS = 'conditions';
  static const TAG_FILTER_COMP = 'comp';
  static const TAG_FILTER_VALUE = 'value';
  static const TAG_FILTER_VALUE_TO = 'toValue';

  /*
   * special pre-defined service to get drop-down values
   */
  static const SERVICE_LIST = 'list';
  /*
	 * form I/O service prefixes
	 */
  static const OP_FETCH = 'get';
  static const OP_NEW = 'create';
  static const OP_UPDATE = 'update';
  static const OP_DELETE = 'delete';
  static const OP_FILTER = 'filter';
  static const OP_BULK = 'bulk';

  /*
	 * filter operators
	 */
  static const FILTER_EQ = '=';
  static const FILTER_NE = '!=';
  static const FILTER_LE = '<=';
  static const FILTER_LT = '<';
  static const FILTER_GE = '>=';
  static const FILTER_GT = '>';
  static const FILTER_BETWEEN = '><';
  static const FILTER_STARTS_WITH = '^';
  static const FILTER_CONTAINS = '~';

  /*
   * value types of fields 
   */
  static const TYPE_TEXT = 0;
  static const TYPE_INTEGER = 1;
  static const TYPE_DECIMAL = 2;
  static const TYPE_BOOLEAN = 3;
  static const TYPE_DATE = 4;
  static const TYPE_TIMESTAMP = 5;
}
