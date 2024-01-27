contract c10483{
    /* solhint-disable code-complexity */
    function exp(uint p, uint q, uint precision) public pure returns (uint) {
        uint n = 0;
        uint nFact = 1;
        uint currentP = 1;
        uint currentQ = 1;
        uint sum = 0;
        uint prevSum = 0;
        while (true) {
            if (checkMultOverflow(currentP, precision)) return sum;
            if (checkMultOverflow(currentQ, nFact)) return sum;
            sum += (currentP * precision) / (currentQ * nFact);
            if (sum == prevSum) return sum;
            prevSum = sum;
            n++;
            if (checkMultOverflow(currentP, p)) return sum;
            if (checkMultOverflow(currentQ, q)) return sum;
            if (checkMultOverflow(nFact, n)) return sum;
            currentP *= p;
            currentQ *= q;
            nFact *= n;
            (currentP, currentQ) = compactFraction(currentP, currentQ, precision);
        }
    }
}