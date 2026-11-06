Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793985763;
	b=mmZSDnblLfzQOXm/iFBh3GjdFzqYOC+3A9N91chYwZNmHzaQpI5zA19hawotRE8oiQoP
	 VVQ8GCcOcDic7lwl+NjTTcjGt5GV3TZCIa0Nv5wqiqISzlX3of7p3LQOZSceiPIgv9lUD
	 zI3HstWvBSIEs4Q7hm8OvjsFYbPL3fhDlFqD5W4lCuhupAAQ/fABWP66L6vt/XU2P2EWP
	 l/r60DAqhuKFMe+CPAIhoMLyG5EIbjMCSPjDUyKhTDk7FbbRyfSYqLI6pX4GDbTroLGti
	 LY7NwxTHUPG8hojr4SZG6c+xmrNGn8upNjUtkPi1wcXNJFylje2eRMq1imReSTAPs9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793985763;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=PeVOmQSCdECqFJA+TCZiMLY1m98+pc6UYgzyD1PjmOM=;
	b=Ua8hphz8MFQhbb9Mal7FZGWAA3Nm5nzCpIxGtZYiCxcpzyLn0IvYXLobL38EKqvOlc5M
	 B8VvS404oj3UeP73X651WA0EkM+YRJ7QgssR31RDPHVYGcPOdSzzBcjgQNwQMEcYROlmG
	 GfOXtxDn0n7IWG5WFxjScHZCcOSZvdnH7UeP8A8o2CXHwlkFKO+lh48Apnm5/UPbGf8Wm
	 5jpacxo1shger8fsqog+HT4P7V9GjZD2g1slPV9/2yMKMeq5HVyCKMn5aiSKbGsO+CrPP
	 PjeivY1gzDBgb6U79yl8QN8p+cQLqif9kAMZbOKuBAb4OB+9cQPihcnMs3QnMzQ4Rcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Pt7I3a3P;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E863C606A326
	for <printk@lists.linux.dev>; Fri,  6 Nov 2026 17:22:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E863C606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Pt7I3a3P
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4b467581b98so7268645e9.0
        for <printk@lists.linux.dev>; Fri, 06 Nov 2026 09:22:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793985761; x=1794590561; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PeVOmQSCdECqFJA+TCZiMLY1m98+pc6UYgzyD1PjmOM=;
        b=Pt7I3a3Pkgu6MQbvzDqkH2F0XBoDQhQsnd5aBXW0O1kg6A8hCKQe25RLXg4Oeo/SSn
         H0eu1KNQ/Gp2ZLwD+hvRG7FBeIegJiH2rQl6PM/DkehcM1I2cxNYCrbqMTcgzE5lnp2L
         APPBnydSCz3+uzjYPrQqvX64eoIUKtSASaYyiw2Hab7fhZ74+8HpG0VJKzLh+maOsL31
         4H0Fo1EwQHw41Wr1jUmvUwTYGs4sY7z3IsLviknRSqgwgVesNSWdxDkm0Il3ZbR1DhZL
         Gij8SzL+t60DoU8dtmyaZW4UXFgCZykSLQwIIJ5gUpsIlte6Muh4ZaYz/lb/wGBJ/qic
         F2Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793985761; x=1794590561;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PeVOmQSCdECqFJA+TCZiMLY1m98+pc6UYgzyD1PjmOM=;
        b=RBKjrR20p+/bwbIcHJa/VSoV8yNjOyk7uaHRzx7LL0BM5TqKZiRm0vhDdWTdgYKsU9
         im4iku1p/W2v04YP/qDTMDBC3PeHx6KtMrDRUxclSvhnQJM8SEtgHLvEuDynAkh7Gb5O
         WeKj2jlXKlDSiaUt2xb8qMndoJXbTTcnpQXh81B92oRfS1BY64bASSQRnxg0BN1fZ3t6
         KCaDNVDdZvp3aRF9vHEzltcb4Ny85LtNJnCMN7cqBmwmilB3nyi3KqGzKP/WOaIbhTPW
         Y1v4sNy01xiixb22ZMhcRpoAPaKw2DQhG6W4DN5VDMMnJh1yFkgcUkEnCKh9zm0LeVzO
         XT/g==
X-Forwarded-Encrypted: i=1; AKwUvByi+b7eyl62+Op55pSye816Fy8VXYD0tx5f7Z1nJDHpT5+VoF/A7fMjXwMQNUkn9ugo9xvlpw4=@lists.linux.dev
X-Gm-Message-State: APuU4Z8MJ+L8hvOHFvq5kEmN31ivU4gajJTaBYPU2AOiXv63bKYP4A6w
	VR27fx2UV/jfOetVQZKAh74OV8zx1/xXlyvDBEXhkdEtrUL6Ve5f6Zf5ce0eZTwhzvw=
X-Gm-Gg: AYBFou3+RJMcaQZvh/DbVXmHyCg9Xd37+a25kKtBLHQz4lEaVSY6R3W8ajZOhBUz8Ad
	VyX2CSHwTBKbGnCiOMNZfgktFOJUA9rrkPVa4ydV22Q6l01eUSLAIG011iwIz865hY8JLx+uNUd
	cd3rOCi6gL5CNShj7ZFi/6gCCsxmr05Z1Xb2Co2onKmVUzhpbybWEtd1gjT8OXrkp9THKwnDRgG
	bQuGWLI8jeNiexr4qp2po0WsovFfcT4+z/WDlA7wg3cbkjYijm6s/J5X8jnURAMAUwd46ecE0Aj
	MyFfWor+4NzH9nqIWRCxSkD4DpddgaaQjW659iAacfTew/qJXn4ndgOhRsIlo9APrAWKQp0wmMI
	nW8OhOkYsgbAACq+rQx5jXtoKNR/Q7e356DMONEhHZMMvopI7VD+5+k0zyHnRGRAchI35SyQ/H/
	FHxfRElCdRElLcn5E8WTCL4odhHJHl+QMGslIFVI8/7sQtFvhwjkqaU3/q3vXYdvJ7izvKfhu6V
	hWcrxx3LCwMC1F5ezU/Emexr2N5keeckKeQIwgWn798K8DFMv1w8uU6VLri1ejYT4+qs+8JIqA8
	Aryb6fWxgAM/lBgm6LZnITTRjG5y7Zg=
X-Received: by 2002:a05:600c:3b87:b0:4a1:a45a:88f with SMTP id 5b1f17b1804b1-4b6dea69603mr55079625e9.20.1793985761324;
        Fri, 06 Nov 2026 09:22:41 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b6e2028d9bsm142108985e9.9.2026.11.06.09.22.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 09:22:40 -0800 (PST)
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
Subject: [PATCH v6 12/16] printk: Separate code for enabling console
Date: Fri,  6 Nov 2026 18:19:48 +0100
Message-ID: <20261106171952.207909-13-pmladek@suse.com>
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

There are several code paths which try to enable a newly registered
console. Move the logic into a separate try_enable_console() function.

It simplifies a bit the long register_console() function definition.

Also followup patches are going to add even more code paths. And it will
be easier to use "return" when it does not make sense to try other
variants.

No behavior change.

Signed-off-by: Petr Mladek <pmladek@suse.com>
Acked-by: Chris Down <chris@chrisdown.name>
---
 kernel/printk/printk.c | 84 ++++++++++++++++++++++++------------------
 1 file changed, 48 insertions(+), 36 deletions(-)

diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
index 0e68af9a3490..947574ee29a3 100644
--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -4041,6 +4041,53 @@ static void try_enable_default_console(struct console *newcon)
 		newcon->flags |= CON_CONSDEV;
 }
 
+#define console_first()				\
+	hlist_entry(console_list.first, struct console, node)
+
+static int try_enable_console(struct console *newcon)
+{
+	int err;
+
+	/*
+	 * See if we want to enable this console driver by default.
+	 *
+	 * Nope when a console is preferred by the command line, device
+	 * tree, or SPCR.
+	 *
+	 * The first real console with tty binding (driver) wins. More
+	 * consoles might get enabled before the right one is found.
+	 *
+	 * Note that a console with tty binding will have CON_CONSDEV
+	 * flag set and will be first in the list.
+	 */
+	if (preferred_dev_console < 0) {
+		if (hlist_empty(&console_list) || !console_first()->device ||
+		    console_first()->flags & CON_BOOT) {
+			try_enable_default_console(newcon);
+		}
+	}
+
+	/* See if this console matches one we selected on the command line */
+	err = try_enable_preferred_console(newcon, true);
+	if (err != -ENOENT)
+		return err;
+
+	/* If not, try to match against the platform default(s) */
+	err = try_enable_preferred_console(newcon, false);
+	if (err != -ENOENT)
+		return err;
+
+	/*
+	 * Some consoles, such as pstore and netconsole, can be enabled even
+	 * without matching. Accept them at this stage when they had a chance
+	 * to match() and call setup().
+	 */
+	if (newcon->flags & CON_ENABLED)
+		err = 0;
+
+	return err;
+}
+
 /* Return the starting sequence number for a newly registered console. */
 static u64 get_init_console_seq(struct console *newcon, bool bootcon_registered)
 {
@@ -4115,9 +4162,6 @@ static u64 get_init_console_seq(struct console *newcon, bool bootcon_registered)
 	return init_seq;
 }
 
-#define console_first()				\
-	hlist_entry(console_list.first, struct console, node)
-
 static int unregister_console_locked(struct console *console);
 
 /*
@@ -4179,39 +4223,7 @@ void register_console(struct console *newcon)
 			goto unlock;
 	}
 
-	/*
-	 * See if we want to enable this console driver by default.
-	 *
-	 * Nope when a console is preferred by the command line, device
-	 * tree, or SPCR.
-	 *
-	 * The first real console with tty binding (driver) wins. More
-	 * consoles might get enabled before the right one is found.
-	 *
-	 * Note that a console with tty binding will have CON_CONSDEV
-	 * flag set and will be first in the list.
-	 */
-	if (preferred_dev_console < 0) {
-		if (hlist_empty(&console_list) || !console_first()->device ||
-		    console_first()->flags & CON_BOOT) {
-			try_enable_default_console(newcon);
-		}
-	}
-
-	/* See if this console matches one we selected on the command line */
-	err = try_enable_preferred_console(newcon, true);
-
-	/* If not, try to match against the platform default(s) */
-	if (err == -ENOENT)
-		err = try_enable_preferred_console(newcon, false);
-
-	/*
-	 * Some consoles, such as pstore and netconsole, can be enabled even
-	 * without matching. Accept them at this stage when they had a chance
-	 * to match() and call setup().
-	 */
-	if (err == -ENOENT && (newcon->flags & CON_ENABLED))
-		err = 0;
+	err = try_enable_console(newcon);
 
 	/* printk() messages are not printed to the Braille console. */
 	if (err || newcon->flags & CON_BRL) {
-- 
2.56.0

