contract c40056{
	 
     
    modifier limitedDaily(uint _value) {
        if (underLimit(_value))
            _;
    }
}