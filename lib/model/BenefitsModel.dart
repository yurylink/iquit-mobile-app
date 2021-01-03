class BenefitModel{
  String name;
  String text;
  int order;
  int dueInSeconds;
  int dueInMinutes;
  int dueInHours;
  int dueInDays;
  num dueInMonths;
  num dueInYears;

  BenefitModel({
      this.name,
      this.text,
      this.order,
      this.dueInSeconds,
      this.dueInMinutes,
      this.dueInHours,
      this.dueInDays,
      this.dueInMonths,
      this.dueInYears});

  String getDueText(){
    if(dueInSeconds != null && dueInSeconds.compareTo(0) > 0){
      return dueInSeconds.toString() + ' second' + (dueInSeconds.compareTo(1)==0?'':'s');

    }else if(dueInMinutes != null && dueInMinutes.compareTo(0) > 0){
      return dueInMinutes.toString() + ' minute' + (dueInMinutes.compareTo(1)==0?'':'s');

    }else if(dueInHours != null && dueInHours.compareTo(0) > 0){
      return dueInHours.toString() + ' hour' + (dueInHours.compareTo(1)==0?'':'s');

    }else if(dueInDays != null && dueInDays.compareTo(0) > 0){
      return dueInDays.toString() + ' day' + (dueInDays.compareTo(1)==0?'':'s');

    }else if(dueInMonths != null && dueInMonths.compareTo(0) > 0){
      return dueInMonths.toString() + ' month' + (dueInMonths.compareTo(1)==0?'':'s');

    }else if(dueInYears != null && dueInYears.compareTo(0) > 0){
      return dueInYears.toString() + ' year' + (dueInYears.compareTo(1)==0?'':'s');

    }
  }
}