#!/usr/bin/env bash
# validate-course.sh - repository structure check for AI Automation Essentials.
set -u
if [ -t 1 ]; then G=$'\e[32m'; R=$'\e[31m'; B=$'\e[1m'; N=$'\e[0m'; else G=; R=; B=; N=; fi
ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
FAIL=0
ok() { printf "  ${G}PASS${N}  %s\n" "$1"; }
bad() { printf "  ${R}FAIL${N}  %s\n" "$1"; FAIL=$((FAIL+1)); }
printf "${B}AI Automation Essentials - course repo validation${N}\n"
required=(
  README.md outline.md slides/slide-list.txt slides/gen.sh
  labs/SETUP.md labs/verify-setup.sh labs/test-all-labs.sh
  course-materials/README.md course-materials/prompt-template.md
  course-materials/prompt-chain-template.md course-materials/output-evaluation-rubric.md
  course-materials/automation-design-canvas.md course-materials/roi-worksheet.md
  course-materials/ai-use-policy-template.md course-materials/capstone-rubric.md
  course-materials/enterprise-project-setup.md course-materials/review-queue-template.md
  course-materials/connector-readiness-checklist.md course-materials/executive-brief-template.md
)
printf "\n${B}Required files${N}\n"
for f in "${required[@]}"; do [ -f "$ROOT_DIR/$f" ] && ok "$f" || bad "$f missing"; done
printf "\n${B}Slides${N}\n"
while IFS= read -r deck; do
  [ -z "$deck" ] && continue
  [ -f "$ROOT_DIR/slides/$deck" ] && ok "slide deck $deck" || bad "slide deck $deck missing"
done < "$ROOT_DIR/slides/slide-list.txt"
printf "\n${B}Labs${N}\n"
expected_labs=(
  01-Foundations 02-Prompt-Engineering 03-Evaluating-Troubleshooting
  04-Automation-Agents 05-Decisions-Insights 06-Responsible-AI-Governance
  07-ROI-Adoption-Capstone
)
for lab in "${expected_labs[@]}"; do
  [ -f "$ROOT_DIR/labs/$lab/README.md" ] && ok "$lab README" || bad "$lab README missing"
done
printf "\n${B}Content checks${N}\n"
grep -qi "AI Automation Essentials" "$ROOT_DIR/README.md" && ok "README course title" || bad "README course title missing"
grep -qi "Course Outline" "$ROOT_DIR/outline.md" && ok "outline has course outline" || bad "outline course outline missing"
grep -qi "Capstone" "$ROOT_DIR/labs/07-ROI-Adoption-Capstone/README.md" && ok "capstone lab present" || bad "capstone lab missing"
printf "\n"
if [ "$FAIL" -eq 0 ]; then printf "${G}${B}Course repo structure is valid.${N}\n"; exit 0
else printf "${R}${B}%d validation failure(s).${N}\n" "$FAIL"; exit 1; fi
