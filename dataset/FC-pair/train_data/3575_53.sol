contract c3575{
    /**
     * @dev Overrides the default function from `FinalizableFundraiser`
     * to check if soft cap was reached and appropriatelly allow refunds
     * or simply close the refund safe.
     */
    function finalization() internal {
        super.finalization();
        if (softCapReached()) {
            refundSafe.close();
        } else {
            refundSafe.allowRefunds();
        }
    }
}