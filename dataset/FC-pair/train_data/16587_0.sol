contract c16587{
    //calculation for the bonus for 1 million tokens
    function bonuscal() private returns(uint)
    {
        c = tokensold / 10 ** 23;
        if (c == 0) 
        {
           return  90;
        }
         return (90 - (c * 10));
    }
}