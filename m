Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795278970;
	b=CFlGb+279ja7YZYqhMsGKzz7bHdsHX679WDgD324p32j9DGWLhDV+SiiXuVLrZFlNFo8
	 6eyQYTvXuRMhjp5pXtzx9WoNxioky+KPTjZq2T5YRb/OypocgtJm2gNoTjel0jEO/4fAl
	 Fh6ZyRsSuTzytT3H/rJJGaRO3ozHSvDXjY9YxjRMOjlK9qn42M7xVNIO4yTBjv+OoP4qJ
	 zFhuKabqO+7bobcYdxMvT+J+95XFr6yW4zzB5fUWdnsVV96SrMBrx22lEY4+7Nljgs1bD
	 HyJrNqlz/yn2l+zVnWmgY1Vq9FZGZDJS4rhrl3OkGA0FNEBAhlfnwg17aKXBrWnmXcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795278970;
	h=DMARC-Filter:From:DKIM-Signature:DKIM-Signature:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=YaO334AmJW9T8HIi70Wn/AoFwkOP8UHzcAm1cZaD4/8=;
	b=0sEm+HXoM6OYEAaR0yn47kZ3XrRg6Eph3U02251lJbKFxCxNuexX2LvGSfZBup3REiyR
	 sQRZkHD8erOAUC2FfsigCto7ukLvqESSLUlSM45hGZezPbgOZ2vOFDfSca8xEk1k4c8AY
	 w4I+0w1GRSPpj9WyIferRcDEk5rnXsbdbJpOa8tdCT+5gJoRCMrJOTdVftW2uZO81xRSi
	 E8KI+EY49AzwzWZg9KmcxLik/AO7Qe0nvgNvEonmXLQ3znWXuIGDAt6Vk/iNlI0UPavol
	 gEQNv+HIKsAEyxKr/j0tgHz89mdVGZPdPq4pEHtKDlxB9vlbLnBCzX9ZpCwjRFDC64Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=ZeXdIJHx;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=xeUa3DMz;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 452A4606A68C
	for <printk@lists.linux.dev>; Sat, 21 Nov 2026 16:36:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 452A4606A68C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=ZeXdIJHx;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=xeUa3DMz
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1795278962;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YaO334AmJW9T8HIi70Wn/AoFwkOP8UHzcAm1cZaD4/8=;
	b=ZeXdIJHxa7tZpGNpzkQVscNxnNal5LPfe2DkMU+4fWEGDFZJfDjtQM/+uOeVdcfLF72IjV
	cozdEn8XmE3a7Tr7jCzc+wr4vcTRCJz5KiysBKwxxne9JLPTEAQqAK4Zks2OXZwP4oEW8F
	snR07jJx2Vv9UcmhYqi2TjQ+kvJdi9zWmSl58yiuo0/mHrrvdmoKd/wvmneOfqTrDuxjCd
	Yzs5JLLhBXZadbsKGH/GggyfZByzm/cmj2w1yIo8X0ge1b5Itw2ISgVPE86EYtZ5/1gAJW
	Vu2y5zZd8Gm7oPBIbgif9W4uFU/+v8q2nAu3rTP2e6zgTNXWTjuUU4sX/PZyIQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1795278962;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YaO334AmJW9T8HIi70Wn/AoFwkOP8UHzcAm1cZaD4/8=;
	b=xeUa3DMzwI0eZgbg8SJuVUwuneXHvGTr2QlulXk10ECZssFUpw8scbxuF5QSdDOK/I8Fis
	TT48+gbY0frOIcCw==
To: Petr Mladek <pmladek@suse.com>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Breno Leitao <leitao@debian.org>,
	printk@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH printk v4 5/8] printk: nbcon: Expand unsafe takeover check for general unsafe
Date: Sat, 21 Nov 2026 17:41:53 +0106
Message-ID: <20261121163557.963029-6-john.ogness@linutronix.de>
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

Currently nbcon_allow_unsafe_takeover() is identifying if hostile
takeovers are permitted.

In order to support unsafe flush policies for CON_NBCON_ATOMIC_UNSAFE,
there needs to be a distinction between atomic flushing using an
unsafe implementation or atomic flushing via hostile takeover. The
former could be allowed in non-panic, whereas the latter is only
allowed on the panic CPU.

Rename nbcon_allow_unsafe_takeover() to nbcon_allow_unsafe() and
change its purpose to identify if unsafe console printing (in general)
is allowed. If yes, hostile takeover can be allowed when on the panic
CPU.

The comments for the WARN verifying no hostile takeover attempts
during non-panic have been expanded. The detailed description will
hopefully remind us of the necessity of restricting hostile takeovers
to the panic CPU.

This opens the door for unsafe flushing (with safe ownership) for
non-panic situations.

No functional change.

Signed-off-by: John Ogness <john.ogness@linutronix.de>
---
 kernel/printk/nbcon.c | 30 ++++++++++++++++++++++--------
 1 file changed, 22 insertions(+), 8 deletions(-)

diff --git a/kernel/printk/nbcon.c b/kernel/printk/nbcon.c
index c3307b5b2c922..8b7483bd57188 100644
--- a/kernel/printk/nbcon.c
+++ b/kernel/printk/nbcon.c
@@ -557,7 +557,13 @@ static int nbcon_context_try_acquire_hostile(struct nbcon_context *ctxt,
 	if (!ctxt->allow_unsafe_takeover)
 		return -EPERM;
 
-	/* Ensure caller is allowed to perform unsafe hostile takeovers. */
+	/*
+	 * Ensure caller is allowed to perform unsafe hostile takeovers.
+	 * It is deeply hard-coded that hostile takeovers must only occur
+	 * on the panic CPU. For example, the single dedicated buffer
+	 * @panic_nbcon_pbufs and the wide use of panic_on_other_cpu() to
+	 * satisfy ownership and waiter rules.
+	 */
 	if (WARN_ON_ONCE(ctxt->prio != NBCON_PRIO_PANIC))
 		return -EPERM;
 
@@ -1454,15 +1460,15 @@ enum nbcon_prio nbcon_get_default_prio(void)
 }
 
 /**
- * nbcon_allow_unsafe_takeover - Check if unsafe console takeovers are allowed
- *					for a specified console and reason
+ * nbcon_allow_unsafe - Check if unsafe console printing is allowed for a
+ *			specified console and reason
  *
  * @con:	The console to check
- * @reason:	The reason for the unsafe takeover
+ * @reason:	The reason for the unsafe console printing
  *
  * Return:	True, when @con is allowed to perform unsafe console printing
  */
-static bool nbcon_allow_unsafe_takeover(struct console *con, enum pr_flush_reason reason)
+static bool nbcon_allow_unsafe(struct console *con, enum pr_flush_reason reason)
 {
 	enum nbcon_prio prio = nbcon_get_default_prio();
 	bool allow = false;
@@ -1670,6 +1676,7 @@ static void __nbcon_atomic_flush_pending(enum pr_flush_reason reason, u64 stop_s
 {
 	bool allow_unsafe_takeover;
 	struct console *con;
+	bool allow_unsafe;
 	int cookie;
 
 	cookie = console_srcu_read_lock();
@@ -1682,24 +1689,31 @@ static void __nbcon_atomic_flush_pending(enum pr_flush_reason reason, u64 stop_s
 		/*
 		 * Using variant of console_is_usable() to include consoles
 		 * with unsafe write_atomic() implementations. They might be
-		 * allowed depending on nbcon_allow_unsafe_takeover().
+		 * allowed depending on nbcon_allow_unsafe().
 		 */
 		if (!nbcon_is_unsafe_usable(con, flags))
 			continue;
 
-		allow_unsafe_takeover = nbcon_allow_unsafe_takeover(con, reason);
+		allow_unsafe = nbcon_allow_unsafe(con, reason);
 
 		/*
 		 * Since nbcon_is_unsafe_usable() was used, ensure @con does
 		 * not have an unsafe write_atomic() if this context expects
 		 * safe printing.
 		 */
-		if ((flags & CON_NBCON_ATOMIC_UNSAFE) && !allow_unsafe_takeover)
+		if ((flags & CON_NBCON_ATOMIC_UNSAFE) && !allow_unsafe)
 			continue;
 
 		if (nbcon_seq_read(con) >= stop_seq)
 			continue;
 
+		/*
+		 * Even if unsafe console printing is allowed, being able to
+		 * perform a hostile takeover additionally requires this CPU
+		 * to be in panic.
+		 */
+		allow_unsafe_takeover = allow_unsafe && panic_on_this_cpu();
+
 		nbcon_atomic_flush_pending_con(con, stop_seq, allow_unsafe_takeover);
 	}
 	console_srcu_read_unlock(cookie);
-- 
2.47.3

