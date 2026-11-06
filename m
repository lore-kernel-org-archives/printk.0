Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793962102;
	b=AEyddwiOPKCxwDyWdeHWbq8D4yrExKeGbEJApvgNNU9sGPEZlW1SUX6UqMfnJKaK0mWY
	 jCzeIEthjo5kdBo5hsYQTfIPWg90s3jGVe1XLszoeZc5/3/UlMfW4DzZyvZlxvD4MFQJo
	 tLHZplTWWXEyGZj72qoh23dSp4jE8crXwLbyiWlMV53Jm6Zrw5exeuAIIZtksxvWxTo6Z
	 Y+GoiCN5zOpNFjEEf4CNMjPgaoygfedplESjJPE5CYGCzKx6Szibsl3qoIYHlQA7+nOQf
	 XWznnlvvtX//g28YWOioNGali7W5CrsS7BD1YVBVmaJGsDHQtUog87O/3O8Xd5p/kuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793962102;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition;
	bh=aTern/SjYwS7EU9tp0WJipbrde6t1sJhlDOVXbBVdYQ=;
	b=453bJwV+GTTxqtWwuuNKULFflDbUd+kRwqPs3sMu26B7q1pSocHKZnY+xA94oZ5zqZNm
	 B+kDC8RlUDySyeEa8ziapCNKMXhTDUn2FE2syYYSKXE1FpHQwP8YNZulg83kBR97xjarT
	 Vikwfl7P11UOxHd64iqs3MuRm7x3trYxaujieUS6mlW6+UtmFbXBgqPgjTTOiw9t3JfDD
	 ovtxhLi6KEk6WelpsaHCPye3+zib7YX9OCqV6qKYZ0g39FG/z1CFiqxZpvSn4FijV3bDq
	 7ot94Nefv4Bv98SvSHjL1vrC5mCug9+LEoF5JA9c10/gcwgumcrC5Z1pbIe2eSxQe0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Y4CCp6ND;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 063A0606A33D
	for <printk@lists.linux.dev>; Fri,  6 Nov 2026 10:48:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 063A0606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Y4CCp6ND
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48dee593f18so372022f8f.3
        for <printk@lists.linux.dev>; Fri, 06 Nov 2026 02:48:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793962099; x=1794566899; darn=lists.linux.dev;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aTern/SjYwS7EU9tp0WJipbrde6t1sJhlDOVXbBVdYQ=;
        b=Y4CCp6NDTc4oFNfiPUQo3I1cqGuM/ZGx+gOCv6xZzo9kpKrf7W6GHqocdx2W5GSms1
         R0XRVMTEHt1i9jsPkLctt6R9Xsq02nDUNBS96DDt4sOdoQb6ONaHpuCyPCJ5ywy91q+j
         Tsv0fRJNlh12srr7+Rk5H5sMs0QNVwFEhNr0cHENBFtIcAAc7dJ+pTkRdUJ8vVTNJ8Wh
         LtbjmMnbRl8p4LnPw6X8iL/BUReVxXiNxSGeRS4FWK+9cWcCxDlLzLFnNrV7S1ntFFvy
         iiEURgkwxsMUC0P+p+rFPXxULyx6jmHQzGcv9e/7MzZCr8VChG6/aOStARuZwuM6SkhJ
         s+sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793962099; x=1794566899;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aTern/SjYwS7EU9tp0WJipbrde6t1sJhlDOVXbBVdYQ=;
        b=fS2koA5yEjZCt/mwMad4sJLi2zVjJkOGAU1qOmtgNsk+3sYptZsaErGMzq3usYEZF2
         AlTa/UDkWGehgw14VpUUsaggecB5tXCXhGwc6QLtSNo7WhTHWWGaakYUiedvEqJ2YexD
         FBuYb/joxcxewSdMI3RcGvuloUYC7Wiwu6dDlohKUZWDk7LdddjmrCzpAbycyfZ0H4O5
         3UiY+jlmxt/iNKbArWxD14kNhJQCAROgCHo0PU8Wz0AWnwFSoLs2Y860qppuTKt3y942
         Va6Fj2Ke0tqzl3sRDuNJ8BdaV4QYi8jGY/XHDUaSJD+B5lORKo/gBQQSPwS/NHf0kshq
         3l2A==
X-Forwarded-Encrypted: i=1; AL+hErF3/6qyvUfRiHKgLBijDVBDal7L3uCZgqO9AIgxikYiXKsEPS7zBdP3gVE6nYvtUqtzzZ5jR/E=@lists.linux.dev
X-Gm-Message-State: APuU4Z/CAALoG71V4tpbOmVvOcQ5A+glCwMInaKumGmnA2Ldoe/X4/3p
	mUPwGjtdpWxfAASSi28nO1w1YuVfKaO03Rig7EF09uNxgSnPxOTB1gLyAffZh5M4iQM=
X-Gm-Gg: AYBFou2YnTMwBR23YFq891DaHFid3oFq4iuZ3P+yKw0HakF4jODvdqpka+8Apg/PTaN
	crZ9Lf63oF0RYTfFXm1bXpoHBL5+p8C8lvzFgEoLdqDK2gBDwbck4N9GlGfj/3y1+SLCA3PFzV/
	jejVML/8jRwEJLSNaJazNAX0jXyKwPb8vfLdk7TClgkDnlJXPMryTxJhAm4KusZky1dD2wJV4qh
	cRbAJiIXNg4WH8HIRPghP33BO9aZuaqca9kmzyg7bnPe/Hz87fmPcPco8HfkbgY+y2fhH1LTUvq
	lMuto2ZIdEJjOXHsosKJrlqhGjw3Hxgy4IUu3jdxWlwkcQLFFrKfXmiiMeimS3jSE5E4UE6VIbL
	CJfMTiZiJwXuaSrD9q1YzHQyM3JQVt5A2frokTMzKhQ52/5rysvo35REqFWa5fSRjehVhvJf/63
	kQclMeYygXW9j61rfyvmRxmtLTckel0HRokPLTMQnAdGEy2XT4Q+6NfuI7h8eL9Elq+zxGUGv3A
	YLV2VtMt2qojEqrqLUMS1Dp4s/8bMu2Pa7w0+eGh522ME205+j+W/6tb9eEVMwmVACUYU1yufso
	30cCfsKmJ3KG2F/XclAW8XAgjYX65y6eakZ6F7Q3kwQDoOzqDhY=
X-Received: by 2002:adf:e196:0:b0:48f:bc59:ab9c with SMTP id ffacd0b85a97d-492760da821mr4292883f8f.12.1793962099388;
        Fri, 06 Nov 2026 02:48:19 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d837e3f5sm3087419f8f.56.2026.11.06.02.48.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 02:48:18 -0800 (PST)
Date: Fri, 6 Nov 2026 11:48:16 +0100
From: Petr Mladek <pmladek@suse.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: John Ogness <john.ogness@linutronix.de>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Peter Zijlstra <peterz@infradead.org>,
	Petr Mladek <pmladek@suse.com>, printk@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] Few printk fixups for 7.4
Message-ID: <au2wcOTpkirvACU6@pathway.suse.cz>
X-Mailing-List: printk@lists.linux.dev
List-Id: <printk.lists.linux.dev>
List-Post: <mailto:printk@lists.linux.dev>
List-Help: <mailto:printk+help@lists.linux.dev>
List-Subscribe: <mailto:printk+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:printk+unsubscribe@lists.linux.dev>
List-Owner: <mailto:printk+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Linus,

please pull few printk fixups from

  git://git.kernel.org/pub/scm/linux/kernel/git/printk/linux.git tags/printk-for-7.4-fixups

================================================================

- Prevent possible use-after-free when printk kthreads could not be created

- Fix computation of the free space when allocating a bigger ring buffer

- Add info about the new printk mailing list for printk-related subsystems

----------------------------------------------------------------
John Ogness (1):
      printk: Avoid multiple unregistration in unregister_console_locked()

Petr Mladek (1):
      MAINTAINERS: Add new "printk" mailing list for PRINTK, PRINTK INDEXING, and VSPRINTF

Wang Wensheng (1):
      printk_ringbuffer: Fix space_used() when blk_lpos->next overflows

 MAINTAINERS                       |  3 +++
 kernel/printk/printk.c            | 34 ++++++++++++++++++++++++++++++----
 kernel/printk/printk_ringbuffer.c |  8 +++-----
 3 files changed, 36 insertions(+), 9 deletions(-)
