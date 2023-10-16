class Validation{
  static checkInputValidation(String? value, String message){
    if(value?.isEmpty ?? true){
      return message;
    }else{
      return null;
    }
  }
}