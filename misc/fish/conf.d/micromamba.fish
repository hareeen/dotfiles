# >>> mamba initialize >>>
# !! Contents within this block are managed by 'mamba init' !!
set -gx MAMBA_EXE "/opt/homebrew/bin/micromamba"
set -gx MAMBA_ROOT_PREFIX "/Users/hareen/micromamba"
$MAMBA_EXE shell hook --shell fish --root-prefix $MAMBA_ROOT_PREFIX | source
# <<< mamba initialize <<<
