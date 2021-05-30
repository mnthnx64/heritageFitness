class SelectOption{
	final dynamic value;
	final String text;
  SelectOption({this.value=0, this.text});
}

class Vo {
  final Map vo;
  Vo({this.vo});
}

extension DefaultMap<K,V> on Map<K,V> {
  V getOrNull(K key) {
    if (this.containsKey(key)) {
      return this[key];
    } else {
      return null;
    }
  }
}

/// Represents and handles the data for a page.
/// Contains data and lists
class FormData {
  Map<String,List<SelectOption>> _lists = {};
  Map<String,dynamic> _data = {};

  FormData();

  /// Sets the [value] for the [fieldName] in the formdata.
  void setFieldValue(String fieldName, dynamic value){
    this._data[fieldName] = value;
  }

  /// Returns the value that exists in the [fieldName]
  dynamic getFieldValue(String fieldName){
    return this._data.getOrNull(fieldName);
  }

  /// Sets a [list] for the [fieldName] in the formdata.
  void setList(String fieldName, List<dynamic> list){
    this._lists[fieldName] = List.generate(list.length, (index) => SelectOption(value: list[index]["value"],text: list[index]["text"]));
    this._data[fieldName] = list.length==0 ? 0 : list[0]["value"];
  }

  /// Returns the list that exists in the [fieldName]
  List<SelectOption> getList(String fieldName){
    List<SelectOption> list = this._lists.getOrNull(fieldName);
    if(list == null){
      return [];
    }
    return list;
  }

  /// Gives the data that is stored in the 
  /// formdata as a Map
  Map<String,dynamic> getRawData(){
    return new Map<String,dynamic>.from(this._data);
  }

  /// Gets the displayed value of the list set to [fieldName]
  String getDisplayedValue(String fieldName){
    final List<SelectOption> list = this._lists[fieldName];
    if (list == null) {
      return null;
    }
    final dynamic val = this.getFieldValue(fieldName);
    if(val == null){
      return null;
    }
    for(int i=0;i < list.length;i++){
      final SelectOption sel = list[i];
      if(sel.value == val){
        return sel.text;
      }
    }
    return null;
  }

  /// Sets all the key pair values in this formdata
  /// the [value] is expeccted to be of type Map
  void setAll(Map value){
    value.forEach((key, val) {
      this.setFieldValue(key, val);
    });
  }
}