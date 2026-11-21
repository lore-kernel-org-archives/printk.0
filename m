Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795278970;
	b=CuWtS/mImJ87gONW9/dCtMerAOfre8Z8DEE7tiYxatOlh2XrV6ufHu1xfJz0n1xNaV/c
	 Jf8MXZMKzZgORgEk+fqebWz6/xa1zjGM6U/no2rOtao9lnd0/mYqvmok90wtCyZ5NwpRQ
	 cUN0DlbFy3IfrQk5T4k9uDvwi30MA0s//VUKzc3fCG/JmYtDNnmwhF50YAV9630tvEkuk
	 yngokh+70om58QK+NVvIzqZZDb+5Igp6S5uggdB1hoLBH0CbSp1H2HsR/Rhs8QVz9xLcv
	 +THaV2Kz3YuQE9MxLMyaNVds78H4bRsDMphqaUbulvaWBnVjjvt8ao3Q161h4cXK0qA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795278970;
	h=DMARC-Filter:From:DKIM-Signature:DKIM-Signature:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=pIeG/X/94duY8UPmUKyn4l6H/vTS0d4bIEK2ndG/QD4=;
	b=zbM47uUFkjbiB4LLY+E6FcsGfa0FPmyaCX2mZ2xFlPAzFv+EVRPUL3kFW6yhGUwXXZ6r
	 7WziVkkvOZlMbljwHVcCDO1r2y3Mb9cCDuHW02uK5AzT211P5z2smcfWQ12/ABhwDrTLQ
	 7YJrqxPx3MUpfovBYQPsEWlvTEEDfGrKweVSfYEfCHKdIaZYGW7TkXiqlqjP8eXZDjOJk
	 ua7iK9gYfgax4UpSqwRujGM97tN6t0BguTUnrIxLg26yxbxKPUTImsw6Nf2HsIW3vJsSQ
	 avx0EDMQoYeLeQTPBqF/oF7jKDAnvOtOZrgsQDT4nsCE40IE2jeeqDyjM84Biya5HRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=nQ8KiLDX;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b="D/S1Z6+c";
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1C49606A69A
	for <printk@lists.linux.dev>; Sat, 21 Nov 2026 16:36:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1C49606A69A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=nQ8KiLDX;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=D/S1Z6+c
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1795278964;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pIeG/X/94duY8UPmUKyn4l6H/vTS0d4bIEK2ndG/QD4=;
	b=nQ8KiLDX3s7hSKwLICbB9eHjqBQk4po22YSK4jlZNPGTbC+Esz0H2dk33AFaV1wHhCbYhx
	eyd0/CzTjtT9kg0mydTvRn1zmouMFY1P723dJ0cZifux29PUIvAvnqreWB6vXYild2vPVS
	/tHVeLscsEbSh9v3lYmMTZb1wwR9IiTVh5QlUMiTuIIM4Eb4f2/vvQEXBc2tNEUdt29rfk
	NoqQxj0wyh68jfa1H/sO/FXDaMugILEYzVc6G6qJ0C0l3KZYMO+02JgZzp49DuQvV6O0f7
	zbIwm3VlO2wdWK2CHaSOIe56Sdm0TR1Zq6teYxtzy9sq95Ug3xGI+6wMhhhjzQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1795278964;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pIeG/X/94duY8UPmUKyn4l6H/vTS0d4bIEK2ndG/QD4=;
	b=D/S1Z6+c9PxhC8o2n1gU5fmCQqLoUYz1+XNoo9grVzlE3fv+IyQiHf3zjO5FUTdfJQ/tH8
	D+OjVtJfsRvK3EBw==
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
	Pavel Tikhomirov <ptikhomirov@virtuozzo.com>,
	Oleg Nesterov <oleg@redhat.com>,
	Bradley Morgan <include@grrlz.net>,
	Alex Elder <elder@riscstar.com>,
	"Cen Zhang (Microsoft)" <blbllhy@gmail.com>,
	Petr Pavlu <petr.pavlu@suse.com>,
	kexec@lists.infradead.org
Subject: [PATCH printk v4 7/8] printk: Add unsafe flush points for panic+kexec and emergency_restart
Date: Sat, 21 Nov 2026 17:41:55 +0106
Message-ID: <20261121163557.963029-8-john.ogness@linutronix.de>
In-Reply-To: <20261121163557.963029-1-john.ogness@linutronix.de>
References: <20261121163557.963029-1-john.ogness@linutronix.de>
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

