(define-module (nrh packages emacs-ox-jira)
  #:use-module (guix packages)
  #:use-module (guix git-download)
  #:use-module (guix build-system emacs)
  #:use-module (guix licenses)
  (define-public emacs-ox-jira
    ;;(use-modules (guix packages)
    ;;             (guix git-download)
    ;;             (guix build-system emacs)
    ;;             (guix licenses)
    ;;             (gnu packages emacs-xyz))
    (package
     (name "emacs-ox-jira")
     (version "20201202.1658")
     (source
      (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/stig/ox-jira.el.git")
             (commit "0bd966ba241a2458d5097e256543eceee50d462c")))
       (sha256
        (base32 "1a1cwq8gaq3q6g7lfm2finz4srla5iyg8s81k2991fz2fh1iir9k"))))
     (build-system emacs-build-system)
     (propagated-inputs `(("emacs-org" ,emacs-org)))
     (home-page "https://github.com/stig/ox-jira.el")
     (synopsis "JIRA Backend for Org Export Engine")
     (description
      "This module plugs into the regular Org Export Engine and transforms Org
files to JIRA markup for pasting into JIRA tickets & comments.

In an Org buffer, hit `C-c C-e j j' to bring up *Org Export Dispatcher*
and export it as a JIRA buffer. I usually use `C-x h' to mark the whole
buffer, then `M-w' to save it to the kill ring (and global pasteboard) for
pasting into JIRA issues.
")
     (license public-domain))))
