Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795043031;
	b=BEohxmGQV8i06dewc7pLZV2dP+/mKCMRmrLI0BMc5N5fVQ/Tdpkr5cxU0eKy2tU5PYx+
	 20kBE3wR/b0DV+n7S0E6X3twmRsphyssv7Mqupd9R9sOdYYiwPkR2FrZU3WS/PFqhFUMc
	 05mjKZAzUFWjxbmMeFHC+VP2riJQILYuYdC6PqLkf15rVLujHDb+N/Ljhpe5Tv42X93bk
	 GVcazqWRz77+gcnku8wNw+HXHZyA7MB6ARirXI0AynAVcbRnyKNoN+ecFWIjDp93ikyOn
	 XEdOecdPIjvGVkuE1IU16pASTcr2rSqMpjwWckiTtFdga9XkY8II3AiPSvgXof0F7uA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795043031;
	h=DMARC-Filter:From:DKIM-Signature:DKIM-Signature:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=pIeG/X/94duY8UPmUKyn4l6H/vTS0d4bIEK2ndG/QD4=;
	b=ePxtp+gp0gI0Mqb4h7IDCsNoqeYsa6b3peC9PMnhEf7/DRWgtwXAJsMP0v2lEZE87xVr
	 tRLRXK9oTfrV083S981Kj8NOvNqSNFm26i98D0LhvFAAIVFt3Esn38DeDLKbMIELYFIjK
	 2NS3Po3SArEQ9/oTQgRtAjuYj5B3xtqpvt9baPfJv1Z2C9xLNwJRh+YaGI71qACVUN0Ng
	 b4obwSq4ImriADZ+0eg2d6T2LGs/VOXfRgl5HVI/1qe/PTYLACKc0E/dQQNfwP27YR5EM
	 qPZw++A525R7B3zQR557ztK6H9wfGN1+0q/06URdXJUpozBN7M1sp3re6wj30H9v4Bg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=kGvYBu+Z;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=oTYLcZxA;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C9DA60A2625
	for <printk@lists.linux.dev>; Wed, 18 Nov 2026 23:03:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C9DA60A2625
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=kGvYBu+Z;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=oTYLcZxA
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1795043030;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pIeG/X/94duY8UPmUKyn4l6H/vTS0d4bIEK2ndG/QD4=;
	b=kGvYBu+ZCD0gFf4HuhZ/QIvcMtNPRb4PfCnWC2KRWN1lOWJRpcakghT3OWuPkfRDKUQEG9
	uXNVCesUBpsxJ0FkWXq5QXaHm96DbL+DH2ye37F3BcqQygsnmgvD3nc1gz1P8wpP8Vpe9J
	BogmE/75LFALbc2MPC0xDHefurulaSni8IntBEdU7IHektsaL95yQ9mf58X+zz65ahHi2Z
	TvjlYGGhahIelEDo7TnJtQZG8JKpGW6swNgOMB7zc7M+Cc+cJWLER9IWSlZLfowjJehQJE
	o43N9DIWZ/OztO9+DnATG7wMwPC8aesmz0JPfl6emZbQNteK71j2XABbmul29A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1795043030;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pIeG/X/94duY8UPmUKyn4l6H/vTS0d4bIEK2ndG/QD4=;
	b=oTYLcZxAsZhZcGO7nA9CN/fclc2HgQP+za1A3bMn7e2yVvneMLb/FaxSPqUB+Z8NVhfezk
	htwO5HAn/q8IxfAg==
To: Petr Mladek <pmladek@suse.com>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Breno Leitao <leitao@debian.org>,
	printk@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Baoquan He <baoquan.he@linux.dev>,
	Mike Rapoport <rppt@kernel.org>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Dave Young <ruirui.yang@linux.dev>,
	Bradley Morgan <include@grrlz.net>,
	Oleg Nesterov <oleg@redhat.com>,
	Pavel Tikhomirov <ptikhomirov@virtuozzo.com>,
	Petr Pavlu <petr.pavlu@suse.com>,
	"Cen Zhang (Microsoft)" <blbllhy@gmail.com>,
	kexec@lists.infradead.org
Subject: [PATCH printk v3 6/7] printk: Add unsafe flush points for panic+kexec and emergency_restart
Date: Thu, 19 Nov 2026 00:09:42 +0106
Message-ID: <20261118230345.808560-7-john.ogness@linutronix.de>
In-Reply-To: <20261118230345.808560-1-john.ogness@linutronix.de>
References: <20261118230345.808560-1-john.ogness@linutronix.de>
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

During emergency and panic, nbcon consoles transition to atomic printing.
However, there are consoles that do not support safe atomic printing
(CON_NBCON_ATOMIC_UNSAFE). Such consoles will only flush when an unsafe
flush is explicitly invoked and their unsafe policy permits unsafe
flushing for that context.

Call nbcon_atomic_flush_unsafe(PR_FLUSH_RESTART) before performing kexec
and emergency restarts in order to allow such consoles to perform an
unsafe flush (if their unsafe policy permits).

Signed-off-by: John Ogness <john.ogness@linutronix.de>
---
 kernel/crash_core.c | 1 +
 kernel/reboot.c     | 1 +
 2 files changed, 2 insertions(+)

diff --git a/kernel/crash_core.c b/kernel/crash_core.c
index d0bd2d0cf8990..79a67956743ac 100644
--- a/kernel/crash_core.c
+++ b/kernel/crash_core.c
@@ -140,6 +140,7 @@ void __noclone __crash_kexec(struct pt_regs *regs)
 
 			crash_setup_regs(&fixed_regs, regs);
 			crash_save_vmcoreinfo();
+			nbcon_atomic_flush_unsafe(PR_FLUSH_RESTART);
 			machine_crash_shutdown(&fixed_regs);
 			crash_cma_clear_pending_dma();
 			machine_kexec(kexec_crash_image);
diff --git a/kernel/reboot.c b/kernel/reboot.c
index a93c23b9e1948..b26d131c54151 100644
--- a/kernel/reboot.c
+++ b/kernel/reboot.c
@@ -102,6 +102,7 @@ void emergency_restart(void)
 	 */
 	nbcon_cpu_emergency_enter();
 	printk_trigger_flush();
+	nbcon_atomic_flush_unsafe(PR_FLUSH_RESTART);
 
 	machine_emergency_restart();
 }
-- 
2.47.3

