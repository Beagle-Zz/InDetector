contract c40203{
     
     
    modifier limitedDaily(uint _value) {
        if (underLimit(_value))
            _;
    }
}