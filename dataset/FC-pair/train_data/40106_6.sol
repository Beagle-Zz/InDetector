contract c40106{
     
     
    modifier limitedDaily(uint _value) {
        if (underLimit(_value))
            _;
    }
}