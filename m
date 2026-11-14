Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794675430;
	b=Mm6Jtux27KOyKUDtr1mjiiF+CHvyGrc+WK1KkWWoM6GyiOMzRcxdjbnxbcysp+NURJeC
	 7K2Lp2ZZY2ayMmrKfTwxI42egOeheGPqKCwU+9jXslbS3ByokOt+/e0Kbzj5sBNgPtbCc
	 wNYRMtab/P2HL5UpUK6MS37kQn7KNbGWyjYzJqY5odkC44SAvG41M3QPUoVpBVIZlA4gp
	 R0vFdkcwkt/ltB3c2gmigHsNFCSSCQvHNmsOlZtannprf4VR9KzfH0iq2xUZwdPshogDK
	 +eimNElLzPVn1f/OYhaSK1tqT7kinFxshzq73aTqWvlIFtXsi/8ODHavkPyU/SjLz1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794675430;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=HNEqvmwAaJcQQT0bJS+96+mgAm147FSeb9nql8qeRUo=;
	b=HyVu9LgjZFcDw2a4AXtPuK7fcLzM5vrqg21lTBYyWwD/bseavZsZD3b8FHAKfvYEzXMb
	 IXjDtzoxWPJiugwJAGzSJmq9ahXdsJp5OE3Rrwf7KhkWWSygZj3SID53QCMMUqy7MJhAt
	 67ZkuvrNS3YAtHmROXlv7ngL05pOuW38dqoOoBbI9bIJUwBKT7Wjq2c0DStJD6/JHeKBi
	 Ubi+IDDdW8q91Xox5ByB3MZ2oO2Z/pJRyEPhOO4l/GTvFY7G2OGAcq6Oi3CS2RCRKF7zH
	 e5G0wtSq7vrWIETcJCPI0cbNkLhwvISEMeQdYm3lW1c92euMxdLpwYBB/L0qr9yIh/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Oin5xr4E;
	arc=none smtp.remote-ip=209.85.167.51
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E05E160A2622
	for <printk@lists.linux.dev>; Sat, 14 Nov 2026 16:57:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E05E160A2622
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Oin5xr4E
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5c0a520df2eso2436963e87.0
        for <printk@lists.linux.dev>; Sat, 14 Nov 2026 08:57:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794675428; x=1795280228; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HNEqvmwAaJcQQT0bJS+96+mgAm147FSeb9nql8qeRUo=;
        b=Oin5xr4EbarYtVeRpyFImb6z5nPZJb4pE82+rtBvRqxSWIWQFnEWubc+xNsECBz04c
         hHtYLWl9YyfwhcgjiS4fa3UrnEfftpQq8v5z34g25fOCe9b/adImm8yqx7XpPRc+xSqH
         /9sK29INB/AdHeTNLAihozjEjcxIgaxCnX/lXKReDv263qOnyzKrHdBOavqnYQFWRdB+
         9RGC8V7g8mtsflvY0YOkcTkI/BnVe2F88ZeJbePW2BM8naK7lzjqeZhE9hDuQeMuYCWs
         NC5WnHNIAnSUkXoG58Z2Z3la6aaCmGL4zpYN9RH5AkluOzOfz1b5jYX7/UazGy89ervS
         QhZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794675428; x=1795280228;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HNEqvmwAaJcQQT0bJS+96+mgAm147FSeb9nql8qeRUo=;
        b=ZloOHFmFDNb4Vlb+joVKNRwcQGx3bMjjoiMCJ/IUPhv0a7CLQrNdSECgR/ZmfQG2t5
         s0lslHQhqfhOVqjsFVFcH+G+IKXnkfrg2A9yB/Ijed5xgDL5cnxPQxeYJpznziojrOQ8
         qcmGWfek1Vz+ijgpNZz4sEGOjumTdY66AVw0Rh0wsa9kwYKGvZritV1t0x0if8LFyn8/
         BNYHqUc/QMMtO385Jw0C0r0gQsCGv5X2qRHXAr/toQa6j8pcH9Hor355+ost4aDsqziL
         4fdZdwB+fpVBudTsdb58cbLscL418TjZSLum5VJzRNbFR2AHEAVe8Z1/TA6QlBJnO2Jb
         UxVQ==
X-Forwarded-Encrypted: i=1; AL+hErFbKcAFIgPve3mBmiuNQC46T77XWjPq1hB+T0ZYbsyVpzIECRRoV8zRph3HNJl+LPP8AhH/hEs=@lists.linux.dev
X-Gm-Message-State: APuU4Z82xGSgAq9hLOItWCY4EUjKMFh0Jlic0MJgVpZdP1RvR4JiySZt
	i/ZhcuMNXfWksNunn/EdAVRvTQx+CsevoJWD5IPXB7u6GPUB3ESa+c/j
X-Gm-Gg: AYBFou1SzbmXz9co+w+uQKwtFhxVZZYFP9d2uHMaqhRlVClrZqIVmWfdp834ZpVZ5cu
	BgBHBHf/9/mU8wT88WhlE/s0jQBq4zDs7UDJd/mXG3549VgWx5LHK2n8f6Qr/ZqQH835Z4l0HsI
	mS80r0mB8FqRrCIEzsV6mnQH/lqCsShjGepTzBi9OTcQDgjR7EI65IQg2yb5Rzz0Wi6A1aPMxYF
	h84EzKCOLKHIQB7WsjJxkXGCps1E3ErF6Q3LoJ+P6iYpsYoL0xHeMG2vQEMgqoJmm4Edao2m6AP
	ayXFP8v5N/O+oOnPlWOLFZ/VyJVZXHY2E5ZX39W5bK0Sy3gnkR0XV8JkyPTKV4rEHFSolHwu+Mj
	u+6yTYgA2Fprq4GocaDkcHKjRqBjoE5qt/m/t7r6vfevLPR3u5kWFahxBkzZw5Hrdy3Bm6eB+Qc
	f8RM4dY37dIEpCpOxRkNZOM3uM+gAhugReJyKWZV5uVdSY+No67sdMPSxGMTBV4I+uxtT8UXAja
	ftn7FigSDnMHgmlwNMa2eiVvdXlv+9sf8CTgua52M8LRcNAeyUhqPQ+KoS2TDX36dYKRJZSYy/j
	+Zj/Dn7l22vznbSVE7w2ghJieyciylbA5VRh5hsBHrqVFmHj3R3tHmhRZ181TxYQDcRopNnXz/w
	iLYo6JJ1xoGA=
X-Received: by 2002:a05:6512:3f0a:b0:5c1:57cd:50b with SMTP id 2adb3069b0e04-5c17079a9e0mr2059501e87.14.1794675427912;
        Sat, 14 Nov 2026 08:57:07 -0800 (PST)
Received: from SafoStation ([31.40.65.49])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1712dad26sm1792051e87.8.2026.11.14.08.57.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 08:57:07 -0800 (PST)
From: Safocl Stollmannovic <safocl88@gmail.com>
To: Petr Mladek <pmladek@suse.com>,
	John Ogness <john.ogness@linutronix.de>,
	Steven Rostedt <rostedt@goodmis.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: linux-kernel@vger.kernel.org,
	printk@lists.linux.dev
Subject: [PATCH v3 11/14] printk: fix duplicate extern declarations
Date: Sat, 14 Nov 2026 20:55:51 +0400
Message-ID: <20261114165612.368785-12-safocl88@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261114165612.368785-1-safocl88@gmail.com>
References: <20261114165612.368785-1-safocl88@gmail.com>
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

Compiling a kernel module with a C++ compiler results in a "duplicate
extern specifier" error.
This occurs because the code contains `extern asmlinkage`, and `asmlinkage`
expands to `extern C` when processed by a C++ compiler.
Since the code already contains sections that respond to a C++ compiler,
I believe it is a perfectly valid approach to gradually move toward a state
where kernel modules can be compiled by a C++ compiler without any issues.
The `extern` specifier must be removed.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=222257
Signed-off-by: Safocl Stollmannovic <safocl88@gmail.com>
---
 include/linux/printk.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/linux/printk.h b/include/linux/printk.h
index f594c1266..09a28181e 100644
--- a/include/linux/printk.h
+++ b/include/linux/printk.h
@@ -136,7 +136,7 @@ struct va_format {
 })
 
 #ifdef CONFIG_EARLY_PRINTK
-extern asmlinkage __printf(1, 2)
+asmlinkage __printf(1, 2)
 void early_printk(const char *fmt, ...);
 #else
 static inline __printf(1, 2) __cold
@@ -200,8 +200,8 @@ void __init setup_log_buf(int early);
 __printf(1, 2) void dump_stack_set_arch_desc(const char *fmt, ...);
 void dump_stack_print_info(const char *log_lvl);
 void show_regs_print_info(const char *log_lvl);
-extern asmlinkage void dump_stack_lvl(const char *log_lvl) __cold;
-extern asmlinkage void dump_stack(void) __cold;
+asmlinkage void dump_stack_lvl(const char *log_lvl) __cold;
+asmlinkage void dump_stack(void) __cold;
 void printk_trigger_flush(void);
 void console_try_replay_all(void);
 void printk_legacy_allow_panic_sync(void);
-- 
2.56.1

