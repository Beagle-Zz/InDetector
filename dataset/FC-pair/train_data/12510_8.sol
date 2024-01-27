contract c12510{
    //initial coach and coach nums;
    function initialCoach(uint _price,uint _emoterate,uint8 _category,uint _num) public onlyOwner{ 
      uint id = originCoach.push(Coach(_price,_emoterate,0,0,_category)) - 1;
      coachAllnums[id] = _num;
      emit initialcoach(id);
    }
}