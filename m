Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794421189;
	b=UoKlZXjS4VMTOKoWhAgNt3ZrTyRvyovTvJ3go0pK/9ZmMFmJcrNcSkG4SjEs6PfA+lhS
	 CXS9AHIhYsDEy+vAY2t+mmIPfwfD1UE3jL8uDD4b45SzwFIxZSZ7TR7YXjjsrOfbRglD/
	 ienOjh7yvzwvg9OW0Pwjhil7CUTHYmQEf0QE7HelDTYZXzz4NiAaSn4qaAaY7EJfdAfu9
	 IA/vqq4f8DC4h/ul7G11q98U8BmmSLvm8egkCvRbrzc2Neq+THCTo/qolWq5DxkTBTLqn
	 B8RL7Ra7j49xCGjm61ZpZbxgaZ/EjnLr3osftktU9kTbbhINBqJD+ZVtRhZqCDoFlRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794421189;
	h=DMARC-Filter:From:DKIM-Signature:DKIM-Signature:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=QGPGgmuQu2fufOLJfGHUvsRMzAjWcvAMNtZA8gm+nvI=;
	b=GdGbyYkx5Ir7RzdF28EnVSX8MsEoJeLypI3GQW0Q63P/c+8gx6Y52mSlybpuanhlIITE
	 /I5sj26l2v+0dBbu2iZ2jPOi4jLoYlBEJBtApsrJoAvbUiMH/YsZJ5LfkpzYimmyHjGHU
	 XW9/kJyVEcJJbnd0/AXGCrjiyq6gVsmiZ2mbmNpArGKXzd2GmHjICXmwnm9zj788xtjG+
	 bT5MhCfnojXxZBiXvaQWb3d6Erl8agw0IGCwPw6cgPcT4odgTnc5HwyNhS19jobou8osU
	 9lUX5YjcSYmSx6UmDYXQjvVcLiZUwKoV4IaTxqlKJduhW5KFovn1SWTsswHJepFWoxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=QBt0qep0;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=iIhaDXlt;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA510606B792
	for <printk@lists.linux.dev>; Wed, 11 Nov 2026 18:19:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CA510606B792
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=QBt0qep0;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=iIhaDXlt
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1794421187;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QGPGgmuQu2fufOLJfGHUvsRMzAjWcvAMNtZA8gm+nvI=;
	b=QBt0qep0KaZaK1m8yU1ZmzaDfPE9YDMX2zsTTb9XauAlI04CnnhJgcabnb2L8h2as+50hE
	pXwJEPklkUXrdDEK8apt/q2n9LSv20XMK1YCmtrJGngtDJ2Yg8SEeLBKmE1zrnQc6PcNqo
	Da3eaonLeIBUVxUX44T/rBM1yYWlr0Rm+ECzA+IDJ6zmJ9bVDqhM030x/2qM643yXG8pyG
	LiogVCai/jSmBzBVmYtsXxfVlWNjjYVf7jSSPVC3xEYLF6OdAOgec0Qwf4qleajZeuGi4H
	jTd9pwUbQwbu6G7ZOgxYS3sscnBaAzWdSIUcnv8SZs6oROovzpDpdtGJ0pi76Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1794421187;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QGPGgmuQu2fufOLJfGHUvsRMzAjWcvAMNtZA8gm+nvI=;
	b=iIhaDXltg9sgD4xI3Yb8DaG0/kXGpDC6XhejljfNSBdorzysTOaVh9z8cAdb8VHfy1tvTX
	wsrlDcWHjztRfeAA==
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
	kexec@lists.infradead.org
Subject: [PATCH printk v2 5/6] printk: Add panic+kexec flush point
Date: Wed, 11 Nov 2026 19:25:21 +0106
Message-ID: <20261111181942.593695-6-john.ogness@linutronix.de>
In-Reply-To: <20261111181942.593695-1-john.ogness@linutronix.de>
References: <20261111181942.593695-1-john.ogness@linutronix.de>
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

During panic, nbcon consoles transition to atomic printing. However,
there are consoles that do not support safe atomic printing
(CON_NBCON_ATOMIC_UNSAFE). Such consoles will only flush during
panic if their unsafe flush policy allows them to do so.

The unsafe flush policy NBCON_PANIC_FLUSH only allows unsafe
flushing when particular flushes are explicitly invoked. Call
printk_trigger_flush(PR_FLUSH_RESTART) before performing the kexec
in order to give such consoles a chance to perform an unsafe flush.

Signed-off-by: John Ogness <john.ogness@linutronix.de>
---
 kernel/crash_core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/kernel/crash_core.c b/kernel/crash_core.c
index d0bd2d0cf8990..064b0af903c38 100644
--- a/kernel/crash_core.c
+++ b/kernel/crash_core.c
@@ -140,6 +140,7 @@ void __noclone __crash_kexec(struct pt_regs *regs)
 
 			crash_setup_regs(&fixed_regs, regs);
 			crash_save_vmcoreinfo();
+			printk_trigger_flush(PR_FLUSH_RESTART);
 			machine_crash_shutdown(&fixed_regs);
 			crash_cma_clear_pending_dma();
 			machine_kexec(kexec_crash_image);
-- 
2.47.3

