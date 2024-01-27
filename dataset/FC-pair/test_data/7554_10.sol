contract c7554{
    /// @dev Returns maximum of an array
    /// @param nums Numbers to look through
    /// @return Maximum number
    function max(int[] nums)
        public
        pure
        returns (int maxNum)
    {
        require(nums.length > 0);
        maxNum = -2**255;
        for (uint i = 0; i < nums.length; i++)
            if (nums[i] > maxNum)
                maxNum = nums[i];
    }
}