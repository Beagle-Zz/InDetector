contract c13044{
    // Private functions
    // Calculates total interest to pay, by checking all batches. Called by main function
    function calculateInterest(address _address) private returns (uint _amount) {
        uint totalAmount = 0; // Total amount to pay
        uint tokenCounted; // Valid tokens counted
        uint intBatch; // interest for each batch in percentage
        uint batchInterest; // Interests for each batch in absolute value
        uint batchAmount;
        uint batchDate;
        for (uint i = token.minIndex(_address); i < token.maxIndex(_address); i++) {
            ( batchAmount , batchDate) = token.getBatch(_address,i); // Get batch data
            intBatch = interest(batchDate); // Calculate interest of this batch
            batchInterest = batchAmount * intBatch / 1 ether / 100; // Apply interest to the batch amount
            if (intBatch > 0) tokenCounted += batchAmount; // Count valid tokens (those with interests)
            totalAmount += batchInterest; // Count total to pay
            emit Batch(
                batchAmount,
                secToDays(softSub(now,batchDate)),
                batchInterest
                );
        }
        // Only pays if there are 150 valid tokens or more
        if ( tokenCounted >= 150 ether ) return totalAmount; else return 0;
    }
}