package main

// Number of seconds to wait before fetches
const GIT_RADAR_FETCH_TIME uint = 15 * 60;

const COLOUR_PREFIX string = "\x01\033[";
const COLOUR_SUFFIX string = "m\x02";

const END_COLOUR string  = COLOUR_PREFIX + "0" + COLOUR_SUFFIX;

// FORMATS
const NORMAL     string  = "0";
const BOLD       string  = "1";

// COLOURS
const DEFAULT      string  = COLOUR_PREFIX + NORMAL         + COLOUR_SUFFIX;
const BLACK        string  = COLOUR_PREFIX + BOLD   + ";30" + COLOUR_SUFFIX;
const RED          string  = COLOUR_PREFIX + BOLD   + ";31" + COLOUR_SUFFIX;
const GREEN        string  = COLOUR_PREFIX + BOLD   + ";32" + COLOUR_SUFFIX;
const YELLOW       string  = COLOUR_PREFIX + BOLD   + ";33" + COLOUR_SUFFIX;
const WHITE        string  = COLOUR_PREFIX + NORMAL + ";37" + COLOUR_SUFFIX;

// Something to show when a fetch is currently in progress
const FETCH_IN_PROGRESS string = " " + YELLOW + "↓" + END_COLOUR;

// Command or script to run when the fetch succeeds. This can be used to notify
// yourself that the fetch has finished if fetching takes a long time
// Set this variable to 'true' if you don't wan to use it.
const FETCH_SUCCEEDED_CMD string = "git-radar-custom-cmds fetch_succeeded";

// Same as above, but if the fetch failed
// Set this variable to 'true' if you don't wan to use it.
const FETCH_FAILED_CMD    string = "git-radar-custom-cmds fetch_failed";

// Command to run before the fetch starts. If this command succeeds, then the
// fetch will start
// Set this variable to 'true' if you don't wan to use it.
const PRE_FETCH_CMD        string = "git-radar-custom-cmds pre_fetch";

// Command to run if the PRE_FETCH_CMD command fails. The fetch will not start
// if this happens
// Set this variable to 'true' if you don't wan to use it.
const PRE_FETCH_CMD_FAILED string = "git-radar-custom-cmds pre_fetch_failed";

// These are the formats used for REMOTE_STATUS in the PROMPT_FORMAT string.
const REMOTE_BEHIND           string = WHITE + "%%PARENT_REMOTE_BRANCH%%" + END_COLOUR + " %%REMOTE_BEHIND%% " + RED     + "→"  + END_COLOUR + " "                  + WHITE + "%%REMOTE_BRANCH%%" + END_COLOUR;
const REMOTE_DIVERGED         string = WHITE + "%%PARENT_REMOTE_BRANCH%%" + END_COLOUR + " %%REMOTE_BEHIND%% " + YELLOW  + "⇄"  + END_COLOUR + " %%REMOTE_AHEAD%% " + WHITE + "%%REMOTE_BRANCH%%" + END_COLOUR;
const REMOTE_AHEAD            string = WHITE + "%%PARENT_REMOTE_BRANCH%%" + END_COLOUR + " " +                   GREEN   + "←"  + END_COLOUR + " %%REMOTE_AHEAD%% " + WHITE + "%%REMOTE_BRANCH%%" + END_COLOUR;
const REMOTE_EQUAL            string = WHITE + "%%PARENT_REMOTE_BRANCH%%" + END_COLOUR + " " +                   DEFAULT + "≈"  + END_COLOUR + " "                  + WHITE + "%%REMOTE_BRANCH%%" + END_COLOUR;
// If no upstream branch is set at all
const REMOTE_NOT_UPSTREAM     string =                                                                           RED     + "⚡" + END_COLOUR                        + WHITE + "%%REMOTE_BRANCH%%" + END_COLOUR;
// If upstream branch is set, but doesn't exist
const REMOTE_NO_SUCH_UPSTREAM string = WHITE + "%%PARENT_REMOTE_BRANCH%%" + END_COLOUR + " " +                   RED     + "⚡" + END_COLOUR                        + RED   + "%%REMOTE_BRANCH%%" + END_COLOUR;
// If parent remote is set, but doesn't exist
const REMOTE_NO_SUCH_PARENT   string = RED   + "%%PARENT_REMOTE_BRANCH%%" + END_COLOUR + " " +                   RED     + "⚡" + END_COLOUR                        + WHITE + "%%REMOTE_BRANCH%%" + END_COLOUR;
// If parent remote is set and upstream branch is set, but neither exist
const REMOTE_NO_SUCH_REMOTES  string = RED   + "%%PARENT_REMOTE_BRANCH%%" + END_COLOUR + " " +                   RED     + "⚡" + END_COLOUR                        + RED   + "%%REMOTE_BRANCH%%" + END_COLOUR;
const REMOTE_SAME             string = WHITE + "%%REMOTE_BRANCH%%" + END_COLOUR;

// These are the formats used for LOCAL_INFO in the PROMPT_FORMAT string.
const LOCAL_AHEAD         string = " %%LOCAL_AHEAD%%"  + GREEN  + "↑" + END_COLOUR;
const LOCAL_BEHIND        string = " %%LOCAL_BEHIND%%" + RED    + "↓" + END_COLOUR;
const LOCAL_DIVERGED      string = " %%LOCAL_BEHIND%%" + YELLOW + "⇵" + END_COLOUR + "%%LOCAL_AHEAD%%";

// Symbols to use for different types of changes
const UNTRACKED_SYM             string = "A";
const STAGED_ADDED_SYM          string = "A";
const STAGED_DELETED_SYM        string = "D";
const STAGED_MODIFIED_SYM       string = "M";
const STAGED_RENAMED_SYM        string = "R";
const STAGED_COPIED_SYM         string = "C";
const STAGED_TYPE_CHANGED_SYM   string = "TC";
const UNSTAGED_DELETED_SYM      string = "D";
const UNSTAGED_MODIFIED_SYM     string = "M";
const UNSTAGED_TYPE_CHANGED_SYM string = "TC";
const STASHED_SYM               string = "≡";
const CONFLICT_US_SYM           string = "U";
const CONFLICT_THEM_SYM         string = "T";
const CONFLICT_BOTH_SYM         string = "B";

// Prefixes and suffixes for different parts of the changes section
const STAGED_PREFIX string = " ";
const STAGED_SUFFIX string = "";

const UNSTAGED_PREFIX string = " ";
const UNSTAGED_SUFFIX string = "";

const UNTRACKED_PREFIX string = " ";
const UNTRACKED_SUFFIX string = "";

const CONFLICTED_PREFIX string = " ";
const CONFLICTED_SUFFIX string = "";

const STASH_PREFIX string = " ";
const STASH_SUFFIX string = "";

// Used for each of the staged values: deleted, modified, renamed, added etc
const CHANGES_STAGED      string = "%%COUNT%%" + GREEN  + "%%SYMBOL%%" + END_COLOUR;

// Used for each of the unstaged values: deleted, modified, type change
const CHANGES_UNSTAGED    string = "%%COUNT%%" + RED    + "%%SYMBOL%%" + END_COLOUR;

// Used for each of the conflicted values: us, them, both
const CHANGES_CONFLICTED  string = "%%COUNT%%" + YELLOW + "%%SYMBOL%%" + END_COLOUR;

// Used Just for the untracked values
const CHANGES_UNTRACKED   string = "%%COUNT%%" + WHITE  + "%%SYMBOL%%" + END_COLOUR;

// Used Just for the stashed values
const STASH_FORMAT        string = "%%COUNT%%" + YELLOW + "%%SYMBOL%%" + END_COLOUR;

// Git radar prompt format
const PROMPT_FORMAT string = BLACK + "git:(" + END_COLOUR + "%%REMOTE_STATUS%%%%LOCAL_INFO%%%%FETCH_IN_PROGRESS%%" + BLACK + ")" + END_COLOUR + "%%STASH_STATUS%%%%STAGED_CHANGES%%%%CONFLICTED_CHANGES%%%%UNSTAGED_CHANGES%%%%UNTRACKED_CHANGES%% ";
