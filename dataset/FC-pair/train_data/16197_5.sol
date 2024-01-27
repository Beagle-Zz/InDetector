contract c16197{
    /// Ensure phase 1 is in progress
    modifier only_in_phase_1 { require (now >= startTime && now < firstPhaseEndTime); _; }
}