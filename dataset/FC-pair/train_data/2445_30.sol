contract c2445{
    /**
     * @dev Update phase end times
     */
    function _updatePhaseTimes() internal {
        require(phase_i != PHASE_NOT_STARTED && phase_i != PHASE_FINISHED, "Bad phase");
        if (phase_i < PHASE_ICO_1)
            ico_phase_1_end = ico_start.add(SECONDS_IN_DAY.mul(ico_phase_1_days));
        if (phase_i < PHASE_ICO_2)
            ico_phase_2_end = ico_phase_1_end.add(SECONDS_IN_DAY.mul(ico_phase_2_days));
        if (phase_i < PHASE_ICO_3)
            ico_phase_3_end = ico_phase_2_end.add(SECONDS_IN_DAY.mul(ico_phase_3_days));
        if (phase_i < PHASE_ICO_4)
            ico_phase_4_end = ico_phase_3_end.add(SECONDS_IN_DAY.mul(ico_phase_4_days));
        if (phase_i < PHASE_ICO_5)
            ico_phase_5_end = ico_phase_4_end.add(SECONDS_IN_DAY.mul(ico_phase_5_days));
        if (phase_i != PHASE_ICO_FINISHED)
            finish_date = ico_phase_5_end.add(SECONDS_IN_DAY.mul(10));
        _updatePhase(false);
    }
}