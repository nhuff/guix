(define-module (nrh packages lisp-web)
  #:use-module (guix packages)
  #:use-module (guix build-system asdf)
  #:use-module (guix git-download)
  #:use-module (ice-9 rdelim)
  #:use-module (ice-9 popen)
  #:use-module (guix gexp)
  #:use-module (guix licenses)
  #:use-module (gnu packages lisp-xyz))

(define-public lisp-web
  (package
   (name "lisp-web")
   (version "1.0")
   (license bsd-2)
   (source
    (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/nhuff/lisp-web.git")
           (commit version)))
     (sha256 (base32 "02z8hx6h8zqyvb857gq7ay33yjvigjcaji4j7p7zvaj73nhyz8lf"))
     (file-name (git-file-name name version))))
   (home-page "https://github.com/nhuff/lisp-web")
   (synopsis "lisp web demo")
   (description "Toy web app written in common lisp")
   (native-inputs `(("bordeaux-threads" ,sbcl-bordeaux-threads)
                    ("hunchentoot" ,sbcl-hunchentoot)))
   (build-system asdf-build-system/sbcl)
   (arguments '(#:asd-systems '("webdemo")
                #:phases
                (modify-phases %standard-phases
                               (add-after 'create-asdf-configuration 'build-program
                                          (lambda* (#:key outputs #:allow-other-keys)
                                            (build-program
                                             (string-append (assoc-ref outputs "out") "/bin/webdemo")
                                             outputs
                                             #:entry-program '((app:main))))))))))
