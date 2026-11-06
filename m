Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793985775;
	b=4p0YldO38NJ67RkTCfhPxV9D8wJpIGt6OGX66mXzxb/EaoNbfdbtRaMILkg4fTWTZXLb
	 TvkLeAY/j9eYKFidspmPzdTjI/MSVfWLw7TTSQi9iXjljzUvjuQCQGyArIv2Uw3PA5kt/
	 t36eCGI0x2OM0VQzweNiS7BzyEQ4g5yFCT0ZdX5ZfArK/hNLcL/jbaAIH3OPQhh72/ybw
	 juiqDQoC+7P7AYstMSfIQdxKEAZ7u3tIx1zrGZPoqmpwfFc5a+gPFaVeE1+rkBTfTZWey
	 rClJ7Ak/1iLbQEhL33MXIVj3TDy+77PHHKLBlw6j5K/k3BDHQxDJCu7clHAcNHcbUEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793985775;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=xBeCxmaO7SBYAAN1RQYHrjs9vewuyjrvlSTeWyFY71M=;
	b=LA+guyZNrf2zi3ECFXRi2zjPehuEP5sKISwpZxPqrUyuX4qVqHqLRz6P8mppjjDR6bK+
	 N4zWcllANHrBI7MIrq40LGpcjNlwbCvog7vSQcm5G3L5tH0QifOyn7Blr5nMDW5nBErL1
	 3diMhfsko6zYQ/YocS6Q76sQSB9SHL5dOoOvaVzZencFh4x1FBJd8UQB4s089wfruTgiV
	 z4i35z/ObWY92ldxNYyjHJzS1huxd2E/uo610lYcXU9FKLblCVI4gaDR7ScLUb7p6xruC
	 0iup1npYfnTk4R2FdPQZbzwyM4vaw2fHHoTLPgdVqtVdEU1n+wRSvOozX4iEQmbByOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b="EMLGbUc/";
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B861606A329
	for <printk@lists.linux.dev>; Fri,  6 Nov 2026 17:22:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B861606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=EMLGbUc/
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-49318428d98so451433f8f.1
        for <printk@lists.linux.dev>; Fri, 06 Nov 2026 09:22:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793985773; x=1794590573; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xBeCxmaO7SBYAAN1RQYHrjs9vewuyjrvlSTeWyFY71M=;
        b=EMLGbUc/1kyoJ5nLyJ1XqZd7yYnBxoeiouDB65YpIX+/crlCgfYvzuui9VEz+yBx3P
         BHZ0uaw7YCuFCBnK6jEDZWc0UvFoT7btfkfkVq/uL11TwGdNQ7OvQiRfwBK1vWxqayWS
         v/I6fp+eWCfAnpcoDQ/t1UwwKeRJ7mZw3rxkbrH3Mvok7aYaHHDPG3BSF2n0jKljqYwX
         LrVJ4cv0WPOrkXZuZqNDzG9VtxpchQu6BqX+tGIAT7gHpFvlywB1s4FeBt4p1fGyC0xc
         zJr4shXykDKo/Z52VDyyAnJKKUVyqmjS2PK0xoPTFJ462m9g8j9LfAi4vkLjZ0SJgJuy
         eEsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793985773; x=1794590573;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xBeCxmaO7SBYAAN1RQYHrjs9vewuyjrvlSTeWyFY71M=;
        b=M0iD0GdeuLZOgu8L6GMkU49LxKzfAS5guXxKwrgONbDuLcKl90obbbGspBzM+SFG2s
         uziSlpKcUJiqKuMLBDEiRnGi/M7K6/rchVIsDEETZXWztIdRt20pPvBviyL7fT/vaoY2
         s9q45zM+d6czllJGY/b5A1V4WbZH0VGEebHP3DIOA2qtlcaRlAqr1oLG+BXIPaegcwvk
         pVncxYVyU1pZcE7cJa26wsdibwNPi2SYbIuW3h5Q859u3x+VAOaR3ll+dAyMqeSx0V4p
         ky6kyA2cqzpMGvHAWj071ibiHrp/8KjQeI2HxnP0qJbsrqsT+hlg2vcl3T+WNLTlx+X6
         9Mew==
X-Forwarded-Encrypted: i=1; AL+hErFXzeOhKYYt/aFMud2uS31FpRoL2WW234sCNvM2hOwB6wcPiTU5b2BmA1GZz3z094XEpHuYtBk=@lists.linux.dev
X-Gm-Message-State: APuU4Z9zy0d8iZEtHxNW3p0vobHs807FTv9fiq3Nk8KwZ/5cZRg4DR2Q
	pIUQDxUgj9aWWw9JQxrxLpwsa2eVP5whk0choUv+uwBwm3bL8khdQkTZMWIfCmc5L9Q=
X-Gm-Gg: AYBFou2gzrp+sb4ZzNW0zF67pEhzVSutlAYsU+tDhEjOW999j2C17MK4aGp/pDYm12h
	LwySo5+66DiAIDrB7y0lWE4QAmJr014kD7xHx8EgTq0M+v7hA0tC/uzudj5UsPidPhB6eErFSc5
	5s2NRLc+Rz6WsQCTRnHtTcvfRzekkTgSb8ooKFLIu6dTp7Rev3xvA3Yl5W4nQOgvqhm0azEurMv
	YdhE60xDEuKSGR8xuc0ABq3n6jdwEJ/1zNERDLB6imn0Dx/Ac+YUhdKT1V8rTO3UWr4TkvpNl+z
	mEjsZ+AFRAFKQBSvLswLPU9wkkdGThnJsujjr1CGjlY41mMZbdqxdk78CTToEPZyFMjp9O4Jevw
	WoCKSffqTiRCdwFGfSvk3EqhYi8sO0QP2t79MgHb72KdYajLjPaII9UhrXWaJ4NYG4Zek0Qvfs7
	pg10nfdskJaseJ6kZmqgaUek97HFYSUUAtlN3qD8ysRKAZNyic6PzCmj/tfv7TcJKJXnmOocpzF
	iQRul/2Mn6eVFW1B8Qb4C4j0K8QL7wO4Ji65FIstWt1yYwrtoMcJU6zbWz+lpE2ULP6xlTx28dJ
	x5S/aTPaUTgRcGX6f5NoGYS8bc48V6o=
X-Received: by 2002:a05:6000:2405:b0:48e:20ed:d5e7 with SMTP id ffacd0b85a97d-49275a2671bmr6769865f8f.34.1793985772980;
        Fri, 06 Nov 2026 09:22:52 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d7cc6187sm4741106f8f.46.2026.11.06.09.22.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 09:22:52 -0800 (PST)
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
Subject: [PATCH v6 13/16] printk: Try to register each console as Braille first
Date: Fri,  6 Nov 2026 18:19:49 +0100
Message-ID: <20261106171952.207909-14-pmladek@suse.com>
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

Braille consoles are unique: they can only be enabled via the command
line and use the preferred console framework for initialization, yet
they are never added to the console_list or associated with
/dev/console. Because of this, the preferred_console variable remains
unset when only a Braille console is requested.

Currently, try_enable_preferred_console() must be called even when
"preferred_dev_console" variable is not set, just to catch these "hidden"
Braille requests.

Refactor the logic by adding a parameter to try_enable_preferred_console()
to explicitly handle Braille vs. non-Braille cases. It will eventually
allow to skip try_enable_preferred_console() when there are no preferred
consoles. This improves code robustness by ensuring the console
setup is explicit and only performed once.

Note that _braille_register_console() is skipped when the given console
driver has a match() callback and it succeeded. It means that it took
over an early console and can't be used as a Braille console.

As a result try_enable_braille_console() might return success even
when it did not enabled the console in the Braille mode. It is
the reason why register_console() has to explicitly check whether
CON_BRL flag was really set and could skip the further steps.

Behavior change:

1. The Braille console driver is newly always preferred even when different
   serial ports are preferred. For example, let's have the following
   command lines:

     a) console=ttyS1,115200     console=brl,ttyS0,115200
     b) console=00:00:0.0,115200 console=brl,ttyS0,115200
     c) console=brl,ttyS0,115200 console=ttyS1,115200

   They all create two entries in preferred_consoles[] because:

     a) and c) differ in @index (0 vs. 1).
     b) defines either @name or @devname.

   But the original code registers:

     a) ttyS1 as normal console because it is the 1st entry in
	preferred_consoles[].

     b) ttyS0 are Braille console because the generic "ttyS" driver
	is registered early in univ8250_console_init(). The @devname
	entry is resolved too late when serial8250_init()
	registers all found devices, it assigns "tty0" for
	the given "00:00:0.0" but it is already in use.

      c) ttyS0 as Braille console because it is the 1st entry in
	 preferred_consoles[].

    The new code would register ttyS0 as the Braille console in
    all three variants because try_enable_braille_console() is
    called 1st.

2. When only the Braille console is defined on the command line,
   the original code might attempt to enable the same console twice.
   One as a default and once as a Braille console. This results in calling
   the setup() callback twice and incorrectly setting the CON_CONSDEV flag.

The 1st change makes the behavior more consistent and understandable.
The 2nd change is an obvious bug fix.

Signed-off-by: Petr Mladek <pmladek@suse.com>
Acked-by: Chris Down <chris@chrisdown.name>
---
 kernel/printk/printk.c | 58 +++++++++++++++++++++++++++++++++++++-----
 1 file changed, 52 insertions(+), 6 deletions(-)

diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
index 947574ee29a3..2bcf82b2c4e3 100644
--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -366,6 +366,7 @@ static int console_locked;
 static struct preferred_console preferred_consoles[MAX_PREFERRED_CONSOLES];
 
 static int preferred_dev_console = -1;
+static bool want_braille_console;
 /* Set when there is at least one console preferred via the command line. */
 int console_set_on_cmdline;
 EXPORT_SYMBOL(console_set_on_cmdline);
@@ -2648,7 +2649,9 @@ static int add_or_update_preferred_console(unsigned int i,
 		braille_set_options(pc, brl_options);
 	}
 
-	if (!brl_options)
+	if (brl_options)
+		want_braille_console = true;
+	else
 		preferred_dev_console = i;
 
 	if (user_specified) {
@@ -3984,8 +3987,9 @@ int console_call_setup(struct console *newcon, char *options)
  * by either the command line or add_preferred_console() and
  * setup/enable it.
  */
-static int try_enable_preferred_console(struct console *newcon,
-					bool user_specified)
+static int __try_enable_preferred_console(struct console *newcon,
+					  bool user_specified,
+					  bool try_only_braille)
 {
 	struct preferred_console *pc;
 	int i, err;
@@ -3996,8 +4000,21 @@ static int try_enable_preferred_console(struct console *newcon,
 		/* Console not yet initialized? */
 		if (!pc->name[0])
 			continue;
-		if (pc->user_specified != user_specified)
-			continue;
+
+		/*
+		 * @try_only_braille and @user_specified define which
+		 * preferred console entries are handled in this round.
+		 */
+		if (try_only_braille) {
+			if (!is_braille_console_preferred(pc))
+				continue;
+		} else {
+			if (is_braille_console_preferred(pc))
+				continue;
+			if (pc->user_specified != user_specified)
+				continue;
+		}
+
 		if (!newcon->match ||
 		    newcon->match(newcon, pc->name, pc->index, pc->options) != 0) {
 			/* default matching */
@@ -4010,7 +4027,7 @@ static int try_enable_preferred_console(struct console *newcon,
 			if (newcon->index < 0)
 				newcon->index = pc->index;
 
-			if (is_braille_console_preferred(pc))
+			if (try_only_braille)
 				return _braille_register_console(newcon, pc);
 
 			err = console_call_setup(newcon, pc->options);
@@ -4026,6 +4043,17 @@ static int try_enable_preferred_console(struct console *newcon,
 	return -ENOENT;
 }
 
+static int try_enable_preferred_console(struct console *newcon,
+					bool user_specified)
+{
+	return __try_enable_preferred_console(newcon, user_specified, false);
+}
+
+static int try_enable_braille_console(struct console *newcon)
+{
+	return __try_enable_preferred_console(newcon, true, true);
+}
+
 /* Try to enable the console unconditionally */
 static void try_enable_default_console(struct console *newcon)
 {
@@ -4048,6 +4076,24 @@ static int try_enable_console(struct console *newcon)
 {
 	int err;
 
+	/*
+	 * First, try to enable the console driver as a Braille console.
+	 * It would have metadata in the preferred_consoles[] array.
+	 * But it won't be counted as preferred_dev_console because
+	 * it does not get printk() messages and is not associated
+	 * with /dev/console.
+	 *
+	 * Note that it might succeed also when the driver has a match()
+	 * callback and it took over a boot console. In this case,
+	 * the driver will continue working as a classic non-Braille
+	 * console.
+	 */
+	if (want_braille_console) {
+		err = try_enable_braille_console(newcon);
+		if (err != -ENOENT)
+			return err;
+	}
+
 	/*
 	 * See if we want to enable this console driver by default.
 	 *
-- 
2.56.0

