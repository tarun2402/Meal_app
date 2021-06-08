import 'package:flutter/material.dart';
import 'package:meal_app/Drawer_mian.dart';

class ScreenFilter extends StatefulWidget {

  static const routeName = '/Filter';

  final Function saveFilters;
  final Map<String,bool> currentFiltters;

  ScreenFilter( this.currentFiltters,this.saveFilters);

  @override
  _ScreenFilterState createState() => _ScreenFilterState();

}
class _ScreenFilterState extends State<ScreenFilter> {
  bool _glutenFree = false;
  bool _vegeterian = false;
  bool _vegan = false;
  bool _lactosFree = false;

  @override
  initState(){
    _glutenFree = widget.currentFiltters['gluten'];
    _lactosFree = widget.currentFiltters['lactose'];
    _vegeterian = widget.currentFiltters['vegetarian'];
    _vegan = widget.currentFiltters['vegan'];
    super.initState();
  }

  Widget _buildSwitchListTile (String title, String description, bool currentValue, Function updateValue){
    return SwitchListTile(
      activeColor: Colors.orange,
      inactiveThumbColor: Colors.blue,
      inactiveTrackColor: Colors.blue[200],
      title: Text(title,style: TextStyle(fontSize: 20,color: Colors.black87,fontWeight: FontWeight.bold),),
      value: currentValue,
      subtitle: Text(description,style: TextStyle(color: Colors.black87),),
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filters'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.save),
              onPressed: (){
            final selectedFiltters =  {
              'gluten': _glutenFree,
              'lactose': _lactosFree,
              'vegan': _vegan,
              'vegetarian': _vegeterian,
            };
            widget.saveFilters(selectedFiltters);
              }
          ),
        ],
      ),
      drawer: DrawerMain(),
      body: Stack(
    children: <Widget> [  Container(
      decoration: BoxDecoration(
          image: DecorationImage(
          image: AssetImage("assets/Images/bg.jpg"),
      fit: BoxFit.cover,
    ),
    ),
    child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Text('Adjust your meal selection', style: Theme.of(context).textTheme.title,),
          ),
          Expanded(
              child: ListView(
                children: <Widget>[
                    _buildSwitchListTile(
                        'Gluten-Free',
                        'Only Include Gluten-free Meals',
                        _glutenFree,
                        (newValue) {
                          setState(() {
                            _glutenFree = newValue;
                          });
                        },
                    ),
                  _buildSwitchListTile(
                    'Lactose-Free',
                    'Only Include Lactose-free Meals',
                    _lactosFree,
                        (newValue) {
                     setState(() {
                      _lactosFree= newValue;
                     });
                    },
                  ),
                  _buildSwitchListTile(
                    'Vegetarian-Free',
                    'Only Include Vegetarian-free Meals',
                    _vegeterian,
                        (newValue) {
                      setState(() {
                        _vegeterian = newValue;
                      });
                    },
                  ),
                  _buildSwitchListTile(
                    'Vegan-Free',
                    'Only Include Vegan-free Meals',
                    _vegan,
                        (newValue) {
                      setState(() {
                        _vegan = newValue;
                      });
                    },
                  ),
                ],
              )
          ),
        ],
      ),
    ),
    ],
      ),
    );
  }
}
