Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793985810;
	b=Lq0KgvOpk7qX1+7o5GvqdHdXUCfNRUBufQUPD5JQdY7k84mrgW0+yUxA0O4fHaDWWo5a
	 GiG7oQxvs3kya6eeIlKt4TxYOuiv3BfZxX3uXSPerTrLVie9/c+NtGAH8SGxZaFaAqHRk
	 xloVRIrL7zBltadEVunv2V46afsOHkFyz9OAKIlu7jt76rJYLcr4WtbAInH0nUzCXFiss
	 C9BDvGQh7IKaen61ElQ/2idMADwIj9ac65F/Ra0a7Jz7jG8M+Qb36H/kVONSZl5bqaf1Z
	 zvQp+EDgZB7K6+dkNH0RdwDNsDLGh1xz4n54WH7AkL94G4D4+g2QIfp04t5Sur5U6qw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793985810;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=6JDFravyo9tiimlPgL8fBtnbINpZklV8LFTh0nIuThY=;
	b=Wa2NqJaYO/GkbQiscUrciEc6vzWoCgDp5Wp/WZKRTy45WC4bTlSuD6mo/xmkTDF4eBMK
	 yozqAa16onzva0qCjUmkGtBXi/0jMZy4OP5hEV0u2VmKOvCbX/IRL6LTVZbMEAfY1mX6n
	 oxbyiGsDOhtmyLag84qYpc4On8nMlST68Hc9BtPj8humDLG4JccnTDN/SKY5ERB1xhLvr
	 weepC+1PUCsR1NKIzPqAsmdRcHv7HKM3l9dm4FshHubWihBAeezcMigToHILquHkagrNJ
	 HijsVvKBDotA6TxOJpnp5LmLmBCmoYCaj8ycsAfK4OQt5+YdLidecn/+5S27uMlEVtw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=EQhvAzF0;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EA1D606A329
	for <printk@lists.linux.dev>; Fri,  6 Nov 2026 17:23:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1EA1D606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=EQhvAzF0
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso6137185e9.1
        for <printk@lists.linux.dev>; Fri, 06 Nov 2026 09:23:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793985807; x=1794590607; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6JDFravyo9tiimlPgL8fBtnbINpZklV8LFTh0nIuThY=;
        b=EQhvAzF0Z6AUEzoimt9B6z/DL/ERsSWe+krqWfqyquXsdR1UBH0m1QdEFe6P/cI8jC
         mZGAPQqjlVQydFVbOyhsJhu7qP0IKgR5p5mHmyInnGKEl6J951LVzqXI4QrdTnQ892Wp
         zmkK6S/24DrJHDyAPwLq3o+J1cHuWvwiiFRUTENZkndbkXrhvMdKxhHNwuXLSHpDHkfZ
         6TDAIa7t7bDr54RARbn6O+CdL35paNChFuSh+SVMyQBO2l0dNSGC7Rie8gO9AriIDG1B
         NfSxveleK9/J7g7Le1WpDbTw4nJR2WpfI/0ygRRxzHJJZVHDEfSsQexwF2fZvR4yFgxK
         NsGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793985807; x=1794590607;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6JDFravyo9tiimlPgL8fBtnbINpZklV8LFTh0nIuThY=;
        b=x2HuPomXX5UpJpahKBWbV5R4kjT+7hYF1zkhrDj2oCAwL2Xs9SUsS4CwOlcxsb8P92
         4+oMkHRB5mTf1uj1wqCLJ1PSX23fXjCpPcqxKBFPjd/cW5ICw1NppcBvwFxRjr+V6xfL
         zVB6nLh/rwxQtsPiitl7o9G7Zmd39PQsf6x6Qr40gVJ93K8UoqLrzPVXZFMKKL44b0vo
         b9Ukl9XUX3sWaDoR/YPSKttAA9Rdr0La9ueNlSMCn6REqYH34YQzQhHOQkqAQyjFqlZr
         Jp2yLhIc1RAg+pRl1dfmU2bCLaeuLlUSc5JGd4f19B+BmZ1NYq5f4ckknbDY4i+rGA6S
         CoZQ==
X-Forwarded-Encrypted: i=1; AKwUvBxu7fmwSGz97lyqCj91HirWa+VNFOqoCn9HcEEGyKWkQlmzJdvG/toUU8B+vu4Z3+2hfFNW/tk=@lists.linux.dev
X-Gm-Message-State: APuU4Z+OLT71jVKQL8r4wi2FjQWNEFTcf6C+/i2beeAMoT1R8QFjOl4L
	GkUaCNL3K0dGsfWnTmte1v8511JnEB3d3aTQ1fenzjcGybpYfW5p7t2/WeX/RwW03HE=
X-Gm-Gg: AYBFou2z0zmp6f0/5/DLT5EBLi0WCZlg0LCVFfYgfAuSr8jr5uRHZyosRUoTg8h++i1
	F03hnFoNgweQoWHYYJZdL2dXQF25sclypbwXvOR2SB63Mbe+UhtrVQEzlgvyDlJJmPyZYUl54mf
	Zzx4cWSjlsYw/sd076RM5b+xcQu4lx++Vjg/bgIDlJJWOTfBPWCnTuUu/S/kLTKxfqUzprZQnJz
	HYUYSvZXnIB8O1Wr2V0yyT+0oJKMpEK/T3hO/fb5ZQXyYyo3dpFfddfjScqoay89bRlajjfyJeY
	lW8o5UB+tQVvZeqojz0FNVQQtspCcPG0nza8PfvNMUfiXm8TlhH2NiU75oVsxKNgWZmUTW3pZSB
	9DL26PjpI0EqhSBC0Q6D5ElivbyCGr+bi1sy7lnG1IH1ae3a9LYJkPiQXnHFsuDhSg+HtmMBMsO
	DHyFnetvUyyE0zB1NUdfrYQrKKdwo+ayJGxGfj2f7THl41WSgIbhXefZmhTYxjR+RYznIB6buzU
	uMU46yOp9IchStYxBVbmGVaMtTD1tZ0Oj5dOXWeC/XfPZNoupsK9NzVQEvrNT5HQURtAhWttYGz
	dlIkpESoiWmD3dHn8Wwigts5tNYHPyY=
X-Received: by 2002:a05:600c:a012:b0:4a2:526b:d3fd with SMTP id 5b1f17b1804b1-4b6df5e9c8amr60438775e9.15.1793985807576;
        Fri, 06 Nov 2026 09:23:27 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b572caf48bsm168315435e9.11.2026.11.06.09.23.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 09:23:27 -0800 (PST)
From: Petr Mladek <pmladek@suse.com>
To: John Ogness <john.ogness@linutronix.de>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Marcos Paulo de Souza <mpdesouza@suse.com>,
	Chris Down <chris@chrisdown.name>,
	Naveen Kumar Chaudhary <naveen.osdev@gmail.com>,
	printk@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Petr Mladek <pmladek@suse.com>
Subject: [PATCH v6 16/16] printk: Try enable preferred consoles only when there are any
Date: Fri,  6 Nov 2026 18:19:52 +0100
Message-ID: <20261106171952.207909-17-pmladek@suse.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261106171952.207909-1-pmladek@suse.com>
References: <20261106171952.207909-1-pmladek@suse.com>
X-Mailing-List: printk@lists.linux.dev
List-Id: <printk.lists.linux.dev>
List-Post: <mailto:printk@lists.linux.dev>
List-Help: <mailto:printk+help@lists.linux.dev>
List-Subscribe: <mailto:printk+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:printk+unsubscribe@lists.linux.dev>
List-Owner: <mailto:printk+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

try_enable_preferred_console() used to be always called because it
had several hidden effects, namely:

- returned success when a console was pre-enabled using CON_ENABLED
  flag.

- enabled Braille consoles which were ignored by "preferred_dev_console"
  because they were not associated with /dev/console.

- returned success when a console was enabled by default because
  try_enable_default_console() did not return success.

The first two hidden effects were removed in previous patches. The already
fixed handling of pre-enabled consoles actually helps even the 3rd case.
try_enable_default_console() sets CON_ENABLED flag on success and
is later handled as pre-enabled.

Prevent any future hidden effects and call try_enable_preferred_console()
only when some console is preferred.

No behavior change.

Signed-off-by: Petr Mladek <pmladek@suse.com>
Acked-by: Chris Down <chris@chrisdown.name>
---
 kernel/printk/printk.c | 26 +++++++++++++++++---------
 1 file changed, 17 insertions(+), 9 deletions(-)

diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
index cbbb9aed3e61..ea8516f93837 100644
--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -4096,7 +4096,7 @@ static int try_enable_default_console(struct console *newcon)
 
 static int try_enable_console(struct console *newcon)
 {
-	int err;
+	int err = -ENOENT;
 
 	/*
 	 * First, try to enable the console driver as a Braille console.
@@ -4135,16 +4135,24 @@ static int try_enable_console(struct console *newcon)
 			if (err != -ENOENT)
 				return err;
 		}
+	} else {
+		/* See if this console matches one we selected on the command line */
+		err = try_enable_preferred_console(newcon, true);
+		if (err != -ENOENT)
+			return err;
+
+		/* If not, try to match against the platform default(s) */
+		err = try_enable_preferred_console(newcon, false);
+		if (err != -ENOENT)
+			return err;
 	}
 
-	/* See if this console matches one we selected on the command line */
-	err = try_enable_preferred_console(newcon, true);
-	if (err != -ENOENT)
-		return err;
-
-	/* If not, try to match against the platform default(s) */
-	err = try_enable_preferred_console(newcon, false);
-	if (err != -ENOENT)
+	/*
+	 * Make sure that pre-enabled consoles won't get registered when
+	 * something went wrong. This is just a paranoid check that all
+	 * branches above returned on error.
+	 */
+	if (WARN_ON(err != -ENOENT))
 		return err;
 
 	/*
-- 
2.56.0

