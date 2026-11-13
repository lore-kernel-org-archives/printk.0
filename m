Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794528938;
	b=OWuSBZ5KrtRMrU4wD2h1G064U7Ju1IAN5PL2A3mLW/F44eWH0gayY5PKcY4FQJTtKRKD
	 3cutGYXDvO0lp1aZg6tI75F//j1SpLKHAxhvHZhmzGFeZHwuMJNO2rmScmrvi/MS2rUPv
	 1GwzORQPEW/6RBN6f+K8mgKsdtcAwOCxE4bIxjtYVZ56v7cSGU+aD/nawdhWpMVL21rnQ
	 iNX98eo7KvEzJWMZO6ahKL98I+1WFPuC/yiNTT0KZ3GiePFth9REOZOGfLZRRsM3uJ19R
	 y7gyBbLdtbPPSDI6ltgYXYghYh8s2avMtGaW5muqw5DqCjhTO3VhgKZ1unacqQmHHAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794528938;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=Fy4WFW4Td97IvBSVlIHdYeCc7+bBQ4nJWzT+60QtQBo=;
	b=asp5R9XQ0pvRKiA3Q1Pw0V4hje7Mv2pYFIBKC3U8ixfXywICXvyt0lfuWNEhzcCorGar
	 AMyU5SrzJ7WkCRJO624t3KBt+BjgIyPluCKZfoLNZi30cxMZQy2ujsxIEWdCdMeYrexuf
	 a4DkK6CA7Hfp3PvI7FwaRUB6Fo0tGBSmi70putKKrIZft00B4HmptmkTuYMtN/oDY21lj
	 QnhK1TN2N2MnOB/IifPGnFTxC0/uwc7/tq8evjvZWR75lnsXgWpCZN2tpfz4Wje4rI0eQ
	 ZCymzdmnn/lXjvZr7l7/ACxa5DjljsOHcPHUvILtJbD9uNg+EmOIXd8ITOR4kZoOAhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lUICjCye;
	arc=none smtp.remote-ip=209.85.167.54
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B522260A261C
	for <printk@lists.linux.dev>; Fri, 13 Nov 2026 00:15:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B522260A261C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lUICjCye
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5c10dc41270so483013e87.2
        for <printk@lists.linux.dev>; Thu, 12 Nov 2026 16:15:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794528936; x=1795133736; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Fy4WFW4Td97IvBSVlIHdYeCc7+bBQ4nJWzT+60QtQBo=;
        b=lUICjCyet9vHGq+v34a1o39S9ZJQ4MvQm/V2bbzR7F3ZipQnUJmndrCDQamR+HRXH5
         R8XALEhaXJ/MtlJXVA+gmpJ3fzHXDCFUsAoYIN63Ftoz5roN1x/3tRJBZ1mqXbNr4rDa
         XkFCWGLHttyJvk6vTc/i/meG+/lzGSNSRwOgDnAcU67iYe4U1aibSK91dyd/mx52uC/w
         zqxAUc/YSXLnmjWBEIa770YWxxZXFHWFEqt6S2nMEQ1lAzyQM+MieGZYEC/mpvxrJa7V
         2A5ITTupDzApfWcuDL739BawixK8iF/kmevG0FsozSQjEVuh+xSVyRCBvv/PlwkQBvar
         ETCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794528936; x=1795133736;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Fy4WFW4Td97IvBSVlIHdYeCc7+bBQ4nJWzT+60QtQBo=;
        b=r3lCHTMGCvUMXhC22jbxa2HvH25tSI2sfUk7htVSIuHn1GtCqgB0c1nYla9PKNOhnX
         8p+tBHzlY6iq7xFItfuL/2XBZT+p3eYLZ7oehWO5W6/OcVxm9RmaK3B4qJ0TyJXjTv/P
         WCXM0GcIGK7P7xgqjm7AUP8tdh5Tt6eD67LANdVf3wpoaocTzeBgw7uWADmmARMPzw38
         RFatAaSYPGifbc+xvzpLXlJDxoVocn++pvfvgvr/XbfMQt1em7yZV31yA6tDiFQA74Sg
         cUIMaFV1IL9V/SGrUClycI/ljVl6J4uMG53tATpdOs3YKvtmspdhgs9+2D0ARN7Kfzek
         94fQ==
X-Forwarded-Encrypted: i=1; AL+hErFfl1/VQYoT0a9ZN/tu9suisLCQc/gdcYiWlOKKANMgwRYOCCikBRsN67JJcxXXAOftsdzCjsM=@lists.linux.dev
X-Gm-Message-State: APuU4Z/Ll8Hu7IXOrIxU6rLArmzT5rM3eJ+P/6QlemJAJvA8mgI7wZhx
	k+lO9ZhsxVcWPssY7Ilfb2mKnBNKdZkSac8U2l71GD+A3IboTTDbhv0c
X-Gm-Gg: AYBFou20MD6UK/20ohnExlwN+DfwHZ3S0Zfig8PCaCUBs7U3cmyywDFDsKAwisX923x
	TM8p98rqwIrnoHbZy0Aoh4rYRNQi7OJfkYzrhzRBJjZN6skRF5yeCneDBrHVesJrkstxmosmg+w
	BS5ee8QyWL7GW5EqeTGRLn9VUebsm0TxR90ASP3/a1MZ6GroiJ3vC5wABH/Gb0qD1eN24mQAkhO
	CJfuAovFxj4a6w4OXhbECqEKEfSLMLYq8W/aOKoC64/RF3OugOhZGIE/z/kturpASCJ0S+Ljt5/
	9PpPOZAs1Jt3T3oAlA1VC7R+xw4DEK+W4yw/hO/DhrTlgZ7SncHE50j/K8SO+QQdQH31IcoGeaO
	TJAho+W70b43aeHN9h+0S5IJONxfn636vcW77r11YJRuJpliHxg0tVESkmbGuvsBgceTqFo3XkE
	e60ZToJfBETnoQMIOeUQLJpopSYrhnYQmA0sFd16+EdzW37oaOTaJrsgpEeKWGLPV4qQg45YoFJ
	FGlBrCfPoUsISdUww32E63tdKhiZyxeqe3PkJFEP+rNB3WsD9V0G9U3LlPChBlZPQZL4a8INQKG
	b9pkA8Ur0PpD32Nn03nDs3TEb+zHzsQbZuHGTlT8sIwFl2FXgXnJbHw/+BK3fb40M/w8eACC5MO
	QSdFPCByWZg==
X-Received: by 2002:a05:6512:a8c:b0:5bf:ce85:50e3 with SMTP id 2adb3069b0e04-5c170a0f613mr334159e87.42.1794528935920;
        Thu, 12 Nov 2026 16:15:35 -0800 (PST)
Received: from SafoStation ([31.40.65.49])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c17133ca01sm200968e87.36.2026.11.12.16.15.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 16:15:35 -0800 (PST)
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
	Len Brown <lenb@kernel.org>,
	Pavel Machek <pavel@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	printk@lists.linux.dev,
	linux-pm@vger.kernel.org
Subject: [PATCH 10/10] kernel: fix duplicate extern declarations
Date: Fri, 13 Nov 2026 04:14:16 +0400
Message-ID: <20261113001432.128201-11-safocl88@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261113001432.128201-1-safocl88@gmail.com>
References: <20261113001432.128201-1-safocl88@gmail.com>
X-Mailing-List: printk@lists.linux.dev
List-Id: <printk.lists.linux.dev>
List-Post: <mailto:printk@lists.linux.dev>
List-Help: <mailto:printk+help@lists.linux.dev>
List-Subscribe: <mailto:printk+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:printk+unsubscribe@lists.linux.dev>
List-Owner: <mailto:printk+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Compiling a kernel module with a C++ compiler results in a duplicate
echo ‘extern’ specifier error.
This occurs because the code contains , and
expands to  when processed by a C++ compiler.
The  specifier must be removed.
https://bugzilla.kernel.org/show_bug.cgi?id=222257

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

