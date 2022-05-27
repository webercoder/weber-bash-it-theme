#!/usr/bin/env bash

SCM_THEME_PROMPT_DIRTY=" ${red}✗"
SCM_THEME_PROMPT_CLEAN=" ${cyan}✓"
SCM_THEME_PROMPT_PREFIX=" ${cyan}|"
SCM_THEME_PROMPT_SUFFIX="${cyan}|"

GIT_THEME_PROMPT_DIRTY=" ${red}✗"
GIT_THEME_PROMPT_CLEAN=" ${cyan}✓"
GIT_THEME_PROMPT_PREFIX=" ${cyan}|"
GIT_THEME_PROMPT_SUFFIX="${cyan}|"

RVM_THEME_PROMPT_PREFIX="|"
RVM_THEME_PROMPT_SUFFIX="|"

THEME_SHOW_CLOCK_CHAR="false"
USER=`whoami`

function prompt_command() {
    CURRENT_TIME=`date '+%m/%d.%-l:%M%p'`
    KUBE_CTX=`kubectl config current-context`
    KUBE_NS=`kubectl config view --minify | grep namespace: | awk -F "namespace: " '{print \$2}'`

    PS1="\n${CURRENT_TIME} ${green}[⎈:${KUBE_CTX}:${KUBE_NS}]${reset_color} ${cyan}\w${reset_color} $(scm_prompt_char_info)${reset_color}\n${cyan}\$${reset_color} "
}

THEME_SHOW_CLOCK_CHAR=${THEME_SHOW_CLOCK_CHAR:-"true"}
THEME_CLOCK_CHAR_COLOR=${THEME_CLOCK_CHAR_COLOR:-"$red"}
THEME_CLOCK_COLOR=${THEME_CLOCK_COLOR:-"$bold_cyan"}
THEME_CLOCK_FORMAT=${THEME_CLOCK_FORMAT:-"%Y-%m-%d %H:%M:%S"}

safe_append_prompt_command prompt_command
