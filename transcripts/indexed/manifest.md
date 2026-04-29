# Indexed Manifest

STATUS: ACTIVE AFTER PATCH
PURPOSE: Track processed raw transcript files to prevent duplicate reads/writes.

<!-- BACKFILL NOTE: Rows 001–020 added 2026-04-29 via manifest backfill write-back. Source of truth: existing indexed outputs in v2/transcripts/indexed/. No transcript reprocessing performed. -->
<!-- IDs with suffix b (001b, 002b, etc.) indicate a second distinct indexed output sharing the same numeric prefix due to parallel source ingestion. -->
<!-- SKIPPED_DUPLICATE rows record known duplicate source files. They are included for deduplication tracking only and do not represent pipeline outputs. -->

| file_id | source_filename | indexed_filename | status | timestamp |
|---|---|---|---|---|
| 001 | 001_3_very_scary_true_stalker_horror_sto.raw.md | 001_3_very_scary_true_stalker_horror_sto_indexed.md | INDEXED | 2026-04-27 |
| 001b | 001_the_club_penguin_degenerates.raw.md | 001_the_club_penguin_degenerates_indexed.md | INDEXED | 2026-04-27 |
| 002 | 002_no_l_carroll_the_paradox_of_horror.raw.md | 002_no_l_carroll_the_paradox_of_horror_indexed.md | INDEXED | 2026-04-27 |
| 002b | 002_terrifying_stalkers_who_turned_into.raw.md | 002_terrifying_stalkers_who_turned_into_indexed.md | INDEXED | 2026-04-27 |
| 003 | 003_the_redpill_tiktoker_hiding_a_dark_s.raw.md | 003 _the_redpill_tiktoker_hiding_a_dark_s_indexed.md | INDEXED | 2026-04-27 |
| 003b | 003_the_horrors_of_the_fox_hollow_farm_s.raw.md | 003_the_horrors_of_the_fox_hollow_farm_s_indexed.md | INDEXED | 2026-04-27 |
| 004 | 004_top_3_scariest_unwanted_guests_hallo.raw.md | 004_top_3_scariest_unwanted_guests_hallo_indexed.md | INDEXED | 2026-04-27 | 
| 005 | 005_top_3_stories_that_sound_fake_but_ar.raw.md | 005_top_3_stories_that_sound_fake_but_ar_indexed.md | INDEXED | 2026-04-27 |
| 006 | 006_top_4_bingeable_scary_stories_terrif.raw.md | 006_top_4_bingeable_scary_stories_terrif_indexed.md | INDEXED | 2026-04-27 |
| 006_DUP | 006_3_disturbing_true_vacation_stories.raw.md | — | SKIPPED_DUPLICATE | 2026-04-29 |
| 007 | 007_paranormal_event_with_proof.raw.md | 007_paranormal_event_with_proof_indexed.md | INDEXED | 2026-04-27 |
| 008 | 008_the_violent_real_life_haunting_of_th.raw.md | 008_the_violent_real_life_haunting_of_th_indexed.md | INDEXED | 2026-04-27 |
| 009 | 009_the_hunt_for_lux_the_internet_s_most.raw.md | 009_the_hunt_for_lux_the_internet_s_most_indexed.md | INDEXED | 2026-04-27 |
| 010 | 010_the_internet_s_darkest_corners_6.raw.md | 010_the_internet_s_darkest_corners_6_indexed.md | INDEXED | 2026-04-27 |
| 011 | 011_3_allegedly_true_skinwalker_encounte.raw.md | 011_3_allegedly_true_skinwalker_encounte_indexed.md | INDEXED | 2026-04-27 |
| 011b | 011_the_disturbing_case_of_the_smurl_hau.raw.md | 011_the_disturbing_case_of_the_smurl_hau_indexed.md | INDEXED | 2026-04-28 |
| 012 | 012_3_unnerving_forest_hiking_camping_ho.raw.md | 012_3_unnerving_forest_hiking_camping_ho_indexed.md | INDEXED | 2026-04-27 |
| 012b | 012_top_3_scariest_true_stories_spooky_s.raw.md | 012_top_3_scariest_true_stories_spooky_s_indexed.md | INDEXED | 2026-04-28 |
| 013 | 013_using_a_ouija_board_ruined_our_lives.raw.md | 013_using_a_ouija_board_ruined_our_lives_indexed.md | INDEXED | 2026-04-27 |
| 014 | 014_3_creepy_true_craigslist_horror_stor.raw.md | 014_3_creepy_true_craigslist_horror_stor_indexed.md | INDEXED | 2026-04-27 |
| 014b | 014_the_real_story_of_the_conjuring_last.raw.md | 014_the_real_story_of_the_conjuring_last_indexed.md | INDEXED | 2026-04-27 |
| 015 | 015_we_spent_halloween_night_in_a_haunte.raw.md | 015_we_spent_halloween_night_in_a_haunte_indexed.md | INDEXED | 2026-04-27 |
| 018 | 018_6_most_disturbing_unsolved_appalachi.raw.md | 018_6_most_disturbing_unsolved_appalachi_indexed.md | INDEXED | 2026-04-27 |
| 019 | 019_5_most_disturbing_internet_rabbit_ho.raw.md | 019_5_most_disturbing_internet_rabbit_ho_indexed.md | INDEXED | 2026-04-27 |
| 020_DUP | 020_the_hunt_for_lux_the_internet_s_most.raw.md | — | SKIPPED_DUPLICATE | 2026-04-29 |
| 021 | 021_3_scary_true_lonely_cabin_horror_sto.raw.md | 021_3_scary_true_lonely_cabin_horror_sto_indexed.md | INDEXED | 2026-04-28 |
| 022 | 022_the_disturbing_case_that_still_haunt.raw.md | 022_the_disturbing_case_that_still_haunt_indexed.md | INDEXED | 2026-04-28 |
| 023 | 023_the_creepiest_cases_of_people_disapp.raw.md | 023_the_creepiest_cases_of_people_disapp_indexed.md | INDEXED | 2026-04-28 |
| 024 | 024_what_happened_to_this_caver_next_was.raw.md | 024_what_happened_to_this_caver_next_was_indexed.md | INDEXED | 2026-04-28 |
| 025 | 025_a_collection_of_horrible_fates.raw.md | 025_a_collection_of_horrible_fates_indexed.md | INDEXED | 2026-04-28 |
| 026 | 026_the_horrifying_story_of_the_black_ho.raw.md | 026_the_horrifying_story_of_the_black_ho_indexed.md | INDEXED | 2026-04-28 |
| 027 | 027_a_collection_of_horrible_fates.raw.md | 027_a_collection_of_horrible_fates_indexed.md | INDEXED | 2026-04-28 |
| 028 | 028_man_hunted_for_200_miles_tells_horri.raw.md | 028_man_hunted_for_200_miles_tells_horri_indexed.md | INDEXED | 2026-04-28 |
| 029 | 029_the_most_dangerous_dive_site_in_sout.raw.md | 029_the_most_dangerous_dive_site_in_sout_indexed.md | INDEXED | 2026-04-28 |
| 030 | 030_miners_discover_something_terrifying.raw.md | 030_miners_discover_something_terrifying_indexed.md | INDEXED | 2026-04-28 |
| 031 | 031_urban_legends_that_turned_out_to_be.raw.md | 031_urban_legends_that_turned_out_to_be_indexed.md | INDEXED | 2026-04-28 |
| 032 | 032_the_fbi_s_10_most_wanted_explained.raw.md | 032_the_fbi_s_10_most_wanted_explained_indexed.md | INDEXED | 2026-04-28 |
| 033 | 033_6_most_disturbing_things_caught_on_p.raw.md | 033_6_most_disturbing_things_caught_on_p_indexed.md | INDEXED | 2026-04-28 |
| 034 | 034_5_most_disturbing_youtube_rabbit_hol.raw.md | 034_5_most_disturbing_youtube_rabbit_hol_indexed.md | INDEXED | 2026-04-28 |
| 035 | 035_6_most_disturbing_websites_on_the_in.raw.md | 035_6_most_disturbing_websites_on_the_in_indexed.md | INDEXED | 2026-04-28 |
| 013b | 013_1_hour_of_true_horror_stories_for_a.raw.md | 013_1_hour_of_true_horror_stories_for_a_indexed.md | INDEXED | 2026-04-29 |
| 015b | 015_10_true_winter_horror_stories_for_a.raw.md | 015_10_true_winter_horror_stories_for_a_indexed.md | INDEXED | 2026-04-29 |
| 007b | 007_3_true_scary_airbnb_horror_stories.raw.md | 007_3_true_scary_airbnb_horror_stories_indexed.md | INDEXED | 2026-04-29 |
| 008b | 008_the_most_disturbing_dark_web_related.raw.md | 008_the_most_disturbing_dark_web_related_indexed.md | INDEXED | 2026-04-29 |
| 018b | 018_the_most_credible_cases_of_broken_re.raw.md | 018_the_most_credible_cases_of_broken_re_indexed.md | INDEXED | 2026-04-29 |
