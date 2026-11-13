Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794532052;
	b=Yv7utRU5ITO3Ag/Iaky19P3y4jCcjhLVPRo8dNrSFGBPSM6E6A10/97pELOrKNDOm1ow
	 c0o2jEy+OzYq+indDvw356C2xp/Qz3BD9iWhutiFeyQWoRm4/zrt2ooobTppMCAnJpdnZ
	 xU+3G2DFI6nAm2ZvR42+QcD6zTsi2cn9tDGXj9s7Gsz8+k+Ge9GbpQcq3hQVL5NsWr1lA
	 oLzlvsEpjafe9Pvif11N9BtZtMIS0YmoK2NsT1+04njPG2I2FYzLC0oPcPKBkdfQNpPHt
	 mH5S32M3AAXi36uQnfbbykCktouNYV99ZFpM3KTwGESAl8L/l10art/IYcUqowmzjlg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794532052;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=y5dvtWN48Of2Ff8r0NZmrMSivJ/dH4bQ2NUxOe+Y+iM=;
	b=XAoJH4gakF8WFA9YHFKvBisXYSK5hJtUADHV7uKmX//D39HrCCBwBVVhbw5fU8VpqLQG
	 VwaenVeqlmcCis6j7hz5VF2n5NHkPhL+Y/ugT6n07pAWecVMB1u/xcp8Zhw0XXlj7Tfex
	 celTzRokzufPCZYuwSiDJ6wMwKUCdkygSY7FbnedD8I3t0Cihy4pch68SrbmgudYJHBYB
	 09rGEihMOJpEtYf1zDU3R+GJZD0DA/qe8Moy23AINv5nmMqhFIQAu0PKUp+EvPhLA8CT/
	 nN28iM2U7b3GfrVVOa0RkigaYr7RCkM7hddTKlyP9qG+XzUi5BealaKbOyRs/CPqjNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Yk6PueZ3;
	arc=none smtp.remote-ip=209.85.208.181
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4277E606A881
	for <printk@lists.linux.dev>; Fri, 13 Nov 2026 01:07:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4277E606A881
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Yk6PueZ3
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-3ae25c84207so3461111fa.3
        for <printk@lists.linux.dev>; Thu, 12 Nov 2026 17:07:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794532050; x=1795136850; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y5dvtWN48Of2Ff8r0NZmrMSivJ/dH4bQ2NUxOe+Y+iM=;
        b=Yk6PueZ3X2XG3SgPj5VLK8Y6VTzGamNQVSyAPcoDKLz18mQ6O13dEA1Lsp+wI0BUAk
         nQOR6dpX736gyRZTBf64MQPW+5JgrHa+enNsc2UNudFA7Gn7OWrRvmpGlYrXPY/0rjjr
         ZFpF0w3hGuMh2W1qyUhm5mCYNb1LcyEY0bAg0H25/t0Q39becnL11oxUIXftOddDmfsl
         0CBHiEcoXiUwv0+GUYTPc1wXOqYC2XM8RAXtR00IO4lgZeqR4rLuFc/s41ipMgD6BrBB
         Uvtz8Uh480996Y2ThQx2fKx9/Tqqx2zYaPehCC7G4XRWOktvGaQLuVj6N8Oef+372inM
         4jMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794532050; x=1795136850;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=y5dvtWN48Of2Ff8r0NZmrMSivJ/dH4bQ2NUxOe+Y+iM=;
        b=HjChHYyyXOAQimdlAqvGcCztG/2jftWlytLbVI6HIhrRcQ1So0+VDJn0nCkI0y4SYm
         YIUW5PfFbZqEVA9SSZ++8iTeHQjG9wG6NaShqIWxuDkLv+PFh0qcY26lNOUZZ6S/JJ1Z
         dD8txDnta41itn/y2UGbaJoKFKw3argTfWZ6/mywmkhm4WIFpCKXbzeiA6+IvslLK0VF
         DymbCb6PMxvPrZPHNmCDLkIc7SwZIe1c2BuT0hdNDApSR4FvWe531DsdrCxaNAr+tcHU
         cFBe/DigfYw/YIILf/QrOFmDWtHV0DN3YTzEpuK/aXV1/m4RIMZwwG5yykUOx20xwsQ5
         8g6A==
X-Forwarded-Encrypted: i=1; AL+hErEbVMPvSCGmnTn6xtgYcUAl3HiGn9IC6nTfqXIOhcPeGF3eNg6bZLz6Z71W3COaqy5Facrf0KA=@lists.linux.dev
X-Gm-Message-State: APuU4Z9ZrBSUzozIc5+ZjWiaQo+B4BXudLWMLIiJgT4ga7vlP15ViRLB
	kcmKgkYuJwo41gL1nvBc360sQoMYcQYIqcWGz9bx7x+tHmQ13SMRklc/
X-Gm-Gg: AYBFou3CnJxPV/n9NoFFJz1MXKnmrE9iG1YLuzFdArhtQPRKyc6UTY3Sx50oitJR0o0
	GNsYpgYnq4x/zW4YbF2MMTcZWl6ujk6twqXo4OurqZFJDZZQReOld8h6/YpBdWciDhqPBNHHqjS
	mgdxxGN5PIlBE2pECHJoSn2mzJECyV977nrwpRF6UU7/D0MlRf1W1tOv+nLfO8IqrP40UuVFw3p
	oj/6dUU5TwwSRuXUMKP2nRVcsBjUCEQD94Biu7cFDcyYIFoG5FaYZ67WfX1D3Nd+s8X9lXnofn5
	4LlypEmUY0xoKS/GUGk+3nmCRVeDMchOmWOZq97tkKb98GRg2z39QZFApEobO4gA67l3pM+2MFA
	FuPOzOga7nq5wateQxfjUA1jzM3rodOf+9KFGviTVpBVPnGjQ5kmwS+0Ouq51G7WHr+ib0JnxL7
	snx1Y8rtnK2BZnBVL2NwqADudbtvLrnTNy75MY4ZVgwCUbZOZ7E5ClGPSZR4TC6OzzyeT/w7NtS
	W266aux8y7H3A2j2fTy/InIpnGcRrbHgtu6oPtMAHnNsq45vf9xRG4HIHOs56rZYTzSd/6FFMtf
	2RKqweXVyAjJj3PTsIW+xxbrXDBRThBFMyBVUOTGE7VSexJfH2/5eCMDRqYvWzG/YFXr9W8mJFQ
	rdJdvlQHhCGeT2NSQKGkZAfjX6I5Ksrc=
X-Received: by 2002:a2e:ac0b:0:b0:3a9:abd6:1acd with SMTP id 38308e7fff4ca-3ae2b4b5d4bmr3909171fa.6.1794532050397;
        Thu, 12 Nov 2026 17:07:30 -0800 (PST)
Received: from SafoStation ([31.40.65.49])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae2b7d183bsm3133941fa.31.2026.11.12.17.07.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 17:07:28 -0800 (PST)
From: Safocl Stollmannovic <safocl88@gmail.com>
To: Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Will Deacon <will@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Waiman Long <longman@redhat.com>,
	Petr Mladek <pmladek@suse.com>,
	John Ogness <john.ogness@linutronix.de>,
	Steven Rostedt <rostedt@goodmis.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Len Brown <lenb@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	printk@lists.linux.dev,
	linux-pm@vger.kernel.org
Subject: [PATCH v2 10/10] kernel: fix duplicate extern declarations
Date: Fri, 13 Nov 2026 05:06:15 +0400
Message-ID: <20261113010631.139191-11-safocl88@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261113010631.139191-1-safocl88@gmail.com>
References: <20261113010631.139191-1-safocl88@gmail.com>
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
 include/linux/lockdep.h      | 2 +-
 include/linux/printk.h       | 6 +++---
 include/linux/sched/task.h   | 2 +-
 include/linux/start_kernel.h | 2 +-
 include/linux/suspend.h      | 4 ++--
 5 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/include/linux/lockdep.h b/include/linux/lockdep.h
index a6451ecbb..f436eab07 100644
--- a/include/linux/lockdep.h
+++ b/include/linux/lockdep.h
@@ -89,7 +89,7 @@ extern void lockdep_init(void);
 extern void lockdep_reset(void);
 extern void lockdep_reset_lock(struct lockdep_map *lock);
 extern void lockdep_free_key_range(void *start, unsigned long size);
-extern asmlinkage void lockdep_sys_exit(void);
+asmlinkage void lockdep_sys_exit(void);
 extern void lockdep_set_selftest_task(struct task_struct *task);
 
 extern void lockdep_init_task(struct task_struct *task);
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
diff --git a/include/linux/sched/task.h b/include/linux/sched/task.h
index 90ed5bc3c..5cdef6b0f 100644
--- a/include/linux/sched/task.h
+++ b/include/linux/sched/task.h
@@ -61,7 +61,7 @@ extern struct task_struct init_task;
 
 extern int lockdep_tasklist_lock_is_held(void);
 
-extern asmlinkage void schedule_tail(struct task_struct *prev);
+asmlinkage void schedule_tail(struct task_struct *prev);
 extern void init_idle(struct task_struct *idle, int cpu);
 
 extern int sched_fork(u64 clone_flags, struct task_struct *p);
diff --git a/include/linux/start_kernel.h b/include/linux/start_kernel.h
index 09f994ac8..5855467ca 100644
--- a/include/linux/start_kernel.h
+++ b/include/linux/start_kernel.h
@@ -8,6 +8,6 @@
 /* Define the prototype for start_kernel here, rather than cluttering
    up something else. */
 
-extern asmlinkage void __init __noreturn start_kernel(void);
+asmlinkage void __init __noreturn start_kernel(void);
 
 #endif /* _LINUX_START_KERNEL_H */
diff --git a/include/linux/suspend.h b/include/linux/suspend.h
index a38150277..b97af3420 100644
--- a/include/linux/suspend.h
+++ b/include/linux/suspend.h
@@ -385,8 +385,8 @@ extern int swsusp_page_is_forbidden(struct page *);
 extern void swsusp_set_page_free(struct page *);
 extern void swsusp_unset_page_free(struct page *);
 extern unsigned long get_safe_page(gfp_t gfp_mask);
-extern asmlinkage int swsusp_arch_suspend(void);
-extern asmlinkage int swsusp_arch_resume(void);
+asmlinkage int swsusp_arch_suspend(void);
+asmlinkage int swsusp_arch_resume(void);
 
 extern u32 swsusp_hardware_signature;
 extern void hibernation_set_ops(const struct platform_hibernation_ops *ops);
-- 
2.56.1

