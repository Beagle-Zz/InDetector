contract c7593{
    // public update
    function safeDeduct(uint _a, uint _b) pure public returns(uint) {
        if (_a < _b) return 0;
        return (_a - _b);
    }
}