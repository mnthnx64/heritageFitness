import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CtTable extends StatefulWidget {
  final NormalTableData metaData;
  final List<Map<dynamic,dynamic>> data;
  final Function(int, dynamic val) callback;
  final bool searchRequired;
  final String searchString;

  CtTable({Key key, this.metaData, this.data, this.callback=_dummyOnFocusChange, this.searchRequired = false, this.searchString = "Search rows........"}) : assert(callback != null), super(key: key);

  static dynamic _dummyOnFocusChange(int row, dynamic val) {}

  @override
  _CtTableState createState() => _CtTableState();
}

class _CtTableState extends State<CtTable> {
  final TextEditingController _searchController = TextEditingController();
  List<Map<dynamic,dynamic>> tempData = [];

  @override
  void initState() { 
    super.initState();
    this.tempData = widget.data;
  }

  @override
  void didUpdateWidget(covariant CtTable oldWidget) {
    super.didUpdateWidget(oldWidget);
    this.tempData = widget.data;
    _searchController.text = "";
    this._search("");
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _getSearchBar(),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Table(
            columnWidths: widget.metaData.columnWidths,
            children: this._getTableRows()
          ),
        ),
      ],
    );
  }

  Widget _getSearchBar(){
    if(!widget.searchRequired){
      return SizedBox();
    }
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      margin: EdgeInsets.only(bottom: 10),
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Color.fromRGBO(0, 0, 0, 0.4)))
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            padding: EdgeInsets.only(left:20,right:10,bottom:2),
            child: Icon(Icons.search_rounded,size: 20,color: Color.fromRGBO(0, 0, 0, 0.9),)
          ),
          Container(
            width: 500,
            child: TextFormField(
              controller: _searchController,
              onChanged: (val) => _search(val),
              style: GoogleFonts.openSans(fontSize:12,fontWeight: FontWeight.w500,color:Colors.black),
              decoration: InputDecoration(
                isDense: true,
                hintText: widget.searchString,
                contentPadding: EdgeInsets.only(left:5,right:10,top:10,bottom:5),
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }

  _search(String val){
    String searchVal = val.toLowerCase();
    this.tempData = widget.data.where((element) {
      bool found = false;
      widget.metaData.columnNames.forEach((col) {
        found = found || element[col].toString().toLowerCase().contains(searchVal);
      });
      return found;
    }).toList();
    setState(() { });
  }

  List<TableRow> _getTableRows(){
    final List<TableRow> rows = [];
    rows.add(this._getHeaderRow());
    tempData.forEach((row) {
      rows.add(this._getDataRow(row));
    });
    if(widget.metaData.buttonRequired) {
      _getButtons(rows);
    }
    if(widget.metaData.menuRequired) {
      _getMenu(rows);
    }
    return rows;
  }

  TableRow _getHeaderRow(){
    List<Widget> headers = [];
    Map<String,String> display = widget.metaData.displayNames;
    widget.metaData.columnNames.forEach((col) {
      headers.add(
        Container(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Text(
            display[col].toString(),
            style: GoogleFonts.openSans(fontSize: 12,color: Color.fromRGBO(0, 0, 0, 0.55), fontWeight: FontWeight.w600)
          )
        )
      );
    });
    return TableRow(
      children: headers
    );
  }
  
  TableRow _getDataRow(Map row){
    List<Widget> rows = [];
    widget.metaData.columnNames.asMap().forEach((index, col) {
      rows.add(
        Container(
          padding: EdgeInsets.symmetric(vertical: 15),
          child: Text(
            row[col].toString(),
            style: GoogleFonts.openSans(fontSize: 12 ,color: index == 0 ? Color(0xFF004FAA) : Color.fromRGBO(0, 0, 0, 0.87), fontWeight: index == 0 ? FontWeight.w600 : FontWeight.w500)
          )
        )
      );
    });
    return TableRow(
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Color(0xFFD8D8D8),style: BorderStyle.solid))
      ),
      children: rows
    );
  }

  _getButtons(List<TableRow> rows){
    widget.metaData.buttonNames.forEach((buttonName, function) {
      rows.asMap().forEach((index,element) {
        element.children.add(
          Container(
            child: TextButton(onPressed: () {
              function(index-1); //call to parent
            }, child: Text(buttonName,style: GoogleFonts.openSans(fontSize:12,color: Color(0xFF004FAA), fontWeight: FontWeight.w600),))
          )
        );
      });
      rows[0].children.last = Text("");
    });
  }

  _getMenu(List<TableRow> rows) {
    List<String> keys = widget.metaData.menuItems.keys.toList();
    rows.asMap().forEach((index,element) {
      if(index == 0){
        element.children.add(Text(""));
        return;
      }
      element.children.add(
        Container(
          padding: EdgeInsets.only(top:12),
          child: PopupMenuButton(
            child: Center(child: Icon(Icons.more_vert,color: Colors.black.withOpacity(0.6),),),
            onSelected: (menuVal) { 
              // print(menuVal.toString());
              widget.callback(index-1,menuVal);
              menuVal(index-1);
              // (index-1);
            },
            itemBuilder: (context) {
              return List.generate(widget.metaData.menuItems.length, (index) {
                return PopupMenuItem(
                  child: Text(keys[index],style:GoogleFonts.openSans(fontSize:14)),
                  value: widget.metaData.menuItems[keys[index]],
                );
              });
            },
          ),
        ),
      );
    });
  }
}

class CtBlackTable extends StatefulWidget {
  final BlackTableData metaData;
  final List<Map<dynamic,dynamic>> data;
  final Function(int) callback;

  CtBlackTable({Key key, this.metaData, this.data, this.callback=_dummyOnFocusChange}) : assert(callback != null), super(key: key);

  static dynamic _dummyOnFocusChange(int val) {}

  @override
  _CtBlackTableState createState() => _CtBlackTableState();
}

class _CtBlackTableState extends State<CtBlackTable> {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20),
      child: Table(
        columnWidths: widget.metaData.buttonRequired ? {(widget.metaData.columnNames.length):FixedColumnWidth(widget.metaData.columnWidth)} : null,
        children: this._getTableRows()
      ),
    );
  }

  List<TableRow> _getTableRows(){
    final List<TableRow> rows = [];
    rows.add(this._getHeaderRow());
    widget.data.forEach((row) {
      rows.add(this._getDataRow(row));
    });
    if(widget.metaData.buttonRequired){
      final String name = widget.metaData.buttonName;
      rows.asMap().forEach((index,element) {
        element.children.add(
          Container(
            child: TextButton(onPressed: () {
              widget.callback(index-1); //call to parent
            }, child: Text(name,style: GoogleFonts.openSans(fontSize:12,color: Color(0xFF004FAA), fontWeight: FontWeight.w600),))
          )
        );
      });
      rows[0].children.last = Text("");
    }
    return rows;
  }

  TableRow _getHeaderRow(){
    List<Widget> headers = [];
    Map<String,String> display = widget.metaData.displayNames;
    widget.metaData.columnNames.forEach((col) {
      headers.add(
        Container(
          padding: EdgeInsets.symmetric(vertical: 5),
          child: Text(
            display[col],
            style: GoogleFonts.openSans(fontSize: 12,color: Color.fromRGBO(0, 0, 0, 1))
          )
        )
      );
    });
    return TableRow(
      children: headers
    );
  }
  
  TableRow _getDataRow(Map row){
    List<Widget> rows = [];
    widget.metaData.columnNames.forEach((col) {
      rows.add(
        Container(
          padding: EdgeInsets.symmetric(vertical: 5),
          child: Text(
            row[col].toString(),
            style: GoogleFonts.openSans(fontSize: 16, fontWeight: FontWeight.w500 ,color: Color.fromRGBO(0, 0, 0, 1))
          )
        )
      );
    });
    return TableRow(
      children: rows
    );
  }

}

class CtButtonTable extends StatefulWidget {
  final ButtonTableData metaData;
  final List<Map<dynamic,dynamic>> data;
  final Function(int,dynamic) menuCallback;
  final bool menuRequried;

  CtButtonTable({Key key, this.metaData, this.data, this.menuCallback=_dummyOnFocusChange, this.menuRequried = true}) : assert(menuCallback != null), super(key: key);

  static dynamic _dummyOnFocusChange(int row,dynamic val) {}

  @override
  _CtButtonTableState createState() => _CtButtonTableState();
}

class _CtButtonTableState extends State<CtButtonTable> {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Table(
        columnWidths: {
          (widget.metaData.columnNames.length + widget.metaData.buttonMap.length) : FixedColumnWidth(25)
        },
        children: this._getTableRows()
      ),
    );
  }

  List<TableRow> _getTableRows(){
    final List<TableRow> rows = [];
    rows.add(this._getHeaderRow());
    widget.data.forEach((row) {
      rows.add(this._getDataRow(row));
    });
    widget.metaData.buttonMap.forEach((name,function) {
      rows.asMap().forEach((index,element) {
        element.children.add(
          Container(
            child: TextButton(onPressed: () {
              function(index-1); //call to parent
            }, child: Text(name,style: GoogleFonts.openSans(fontSize:12,color: Color(0xFF004FAA), fontWeight: FontWeight.w600),))
          )
        );
      });
      rows[0].children.last = Text("");
    });
    if(widget.menuRequried){
    List<String> keys = widget.metaData.moreMap.keys.toList();
    rows.asMap().forEach((index,element) {
      element.children.add(
        Container(
          padding: EdgeInsets.only(top:10),
          child: PopupMenuButton(
            child: Center(child: Icon(Icons.more_vert)),
            onSelected: (menuVal) { 
              widget.menuCallback(index-1,menuVal);
            },
            itemBuilder: (context) {
              return List.generate(widget.metaData.moreMap.length, (index) {
                return PopupMenuItem(
                  child: Text(keys[index]),
                  value: widget.metaData.moreMap[keys[index]],
                );
              });
            },
          ),
        ),
      );
    });
    rows[0].children.last = Text("");
    }
    return rows;
  }

  TableRow _getHeaderRow(){
    List<Widget> headers = [];
    Map<String,String> display = widget.metaData.displayNames;
    widget.metaData.columnNames.forEach((col) {
      headers.add(
        Container(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Text(
            display[col],
            style: GoogleFonts.openSans(fontSize: 10,color: Color.fromRGBO(0, 0, 0, 0.55))
          )
        )
      );
    });
    return TableRow(
      children: headers
    );
  }
  
  TableRow _getDataRow(Map row){
    List<Widget> rows = [];
    widget.metaData.columnNames.asMap().forEach((index, col) {
      rows.add(
        Container(
          padding: EdgeInsets.symmetric(vertical: 15),
          child: Text(
            row[col].toString(),
            style: GoogleFonts.openSans(fontSize: 12, fontWeight: FontWeight.w500 ,color: index == 0 ? Color(0xFF004FAA) : Color.fromRGBO(0, 0, 0, 0.87))
          )
        )
      );
    });
    return TableRow(
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Color(0xFFD8D8D8),style: BorderStyle.solid))
      ),
      children: rows
    );
  }

}

class ButtonTableData {
  List<String> columnNames;
  Map<String,String> displayNames;
  Map<String,Function(int)> buttonMap;
  Map<String,int> moreMap;
  double columnWidth;

  ButtonTableData(this.columnNames, this.displayNames, this.buttonMap, this.moreMap, {this.columnWidth=100});
  
}

class BlackTableData {
  List<String> columnNames;
  Map<String,String> displayNames;
  bool buttonRequired;
  String buttonName;
  double columnWidth;

  BlackTableData(this.columnNames, this.displayNames, {this.buttonRequired=false, this.buttonName="EDIT",this.columnWidth=100});
  
}

class NormalTableData {
  List<String> columnNames;
  Map<String,String> displayNames;
  bool buttonRequired;
  Map<String,Function(int)> buttonNames;
  bool menuRequired;
  Map<String,dynamic> menuItems;
  Map<int,TableColumnWidth> columnWidths;

  NormalTableData(this.columnNames, this.displayNames, {@required this.buttonRequired, @required this.menuRequired, this.buttonNames, this.menuItems, this.columnWidths});
  
}