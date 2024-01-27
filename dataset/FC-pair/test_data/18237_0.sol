contract c18237{
        /// @return total amount of tokens
        modifier ifSales() {
                if (!seller[msg.sender]) throw;
                _;
        }
}