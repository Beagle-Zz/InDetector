contract c40499{
	 
     
    modifier limitedDaily(uint _value) {
        if (underLimit(_value))
            _;
    }
}