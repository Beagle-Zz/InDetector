contract c40640{
     
     
    modifier limitedDaily(uint _value) {
        if (underLimit(_value))
            _;
    }
}