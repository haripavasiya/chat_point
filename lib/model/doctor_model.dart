class DoctorModel{
  String _imageUrl;
  String _name;
  String _time;
  String _category;
  String _rate;

  get imageUrl => _imageUrl;
  get name => _name;
  get time => _time;
  get category => _category;
  get rate => _rate;

  DoctorModel(this._imageUrl, this._name, this._time, this._category, this._rate);
}