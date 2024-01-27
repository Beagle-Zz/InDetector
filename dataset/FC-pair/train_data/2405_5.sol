contract c2405{
    // MODIFIERS
    // simple modifier for daily limit.
    modifier limitedDaily(uint _value) {
        if (underLimit(_value))
            _;
    }
}