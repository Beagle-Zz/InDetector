contract c8655{
    // returns CHUNK_SIZE loan products starting from some offset:
    // [ productId, minDisbursedAmount, term, discountRate, collateralRatio, defaultingFeePt, maxLoanAmount, isActive ]
    function getProducts(uint offset) external view returns (uint[8][CHUNK_SIZE] response) {
        for (uint16 i = 0; i < CHUNK_SIZE; i++) {
            if (offset + i >= products.length) { break; }
            LoanProduct storage product = products[offset + i];
            response[i] = [offset + i, product.minDisbursedAmount, product.term, product.discountRate,
                            product.collateralRatio, product.defaultingFeePt,
                            monetarySupervisor.getMaxLoanAmount(product.minDisbursedAmount), product.isActive ? 1 : 0 ];
        }
    }
}