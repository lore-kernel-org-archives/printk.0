Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794411160;
	b=kz2yMp3L53c3RdvJwI2hRRaYEkoFtveKmKK/hx6SznHbqysVCbTB7wMB3JZm1Vy+niQx
	 gpzzVO9JmhsqkW8TIPpuULhN5svk5VGbks2FA3ANFpSvaWUmINT0feSsfjUoKanTsH12x
	 TIdqJoMylAmVx24ejM3QitYKwtaeaeY+IrUU9pCcDZXnALvxzmQqbtqtf8hun8nfm7JCC
	 xummD1Muya3X5aeS9gribLOH03+Ztj0fEqf2SxsX/xfF1q3jKX0ihiduWeKKzXkefhZ6V
	 gysgIGfnh8KoFQ91ZedHLhU98TbjoaKQgNpUSVFnDX2oI5tDjHrSQBWDH6cbPvjOXMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794411160;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=PgP1qIz2w/OR/xuvf7y5aFs0i8Rdt5F7Eb+3pqImopk=;
	b=xJAF/DwvM818BIkmwkxWtVVuvCu9getp0WPsHzuXJys9HPoGk9XISb62hdoT1sZ7HFf8
	 jxfjI/XeyMBPAVP7DMcqUitHGHW2opyMT0l6Ihexo1MzzivNLalewn4+wlZc8/kxItIBW
	 s9J+/3HgktatGhj7WY5HvgwJN/AWFNQBk+Jlgt2C7J3bcM+jO6IaWflIEBKHr7aipx3fr
	 cTLiiZhDYGOnOLwgNbA6NP0ISZY+0+kcSqA0S40Yq5IgBrlDhld9tGohxRr8STqsXNn9y
	 Q/oSWraJ3V7oEZI5OB+Egc7f/YKW4QDWi/SFW6oXcjg9iDGnszR67NLWqhzmmRSd/8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=CJcEmX2q;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57A50606A324
	for <printk@lists.linux.dev>; Wed, 11 Nov 2026 15:32:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57A50606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=CJcEmX2q
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4b7252a32c8so35371525e9.0
        for <printk@lists.linux.dev>; Wed, 11 Nov 2026 07:32:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1794411159; x=1795015959; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PgP1qIz2w/OR/xuvf7y5aFs0i8Rdt5F7Eb+3pqImopk=;
        b=CJcEmX2q+lUnjjs7YH/SUU/rum2yNhnbmYQqiE39Ucaj/3BSEB80Zchl5cgr/H6OMK
         dKVr9MALtCo/9SUhwfMAWyYB9oX5iveHYUlNHguqiV4Bi17TgSxjNNkz9/xiif7Vw8HU
         sAWGyGzAl1HGL96flg8epB1BMDoleksjY9unA8dFOc94SO1RE+vThhsBMYaU9iFtcPPP
         D4hHyRkFj7Y9skQdymecdOrgi8ePJEZJr5r2j/RRA6twEN3fRv7MmevOvZY3vyM1U/uo
         Bk/gh0RJGnHk5uKv1tRSDJ7PUzuLHi19NRnOu6it/pjN8r2m6+HP4NR/8oGJCjknR5Oz
         LelA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794411159; x=1795015959;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PgP1qIz2w/OR/xuvf7y5aFs0i8Rdt5F7Eb+3pqImopk=;
        b=1Rp8+yBVDf88UNz/iH6cFM5U2wiMSyPIrmwFKw2o516XGgnueMQvELs9ik1G1qSgGD
         VEsMjruMlg9LklAVB2RITx0Uvdornr8czyFNklyG9OZYoVxAcBwEs11gRXcovoI75wn4
         hqu4dQgV/DbByUtB3F9x/m1SB2SA738NP5OcCjHFW27UCiPGFQPt8Nccu+9kXLwV0n3H
         XaxSbGdu177MrM0pw0xTgekeKqGzM7HWJ2NHfx6GVFCoefG4LsgxQF2NIZ5cOKlBesXo
         M5ujNDHcjoWpP1v/K7V5Xc9hNvYKIiNZsmzVWg1pdgfpR9gVx6tOwDb8JL0S3mMvYPq6
         rm1Q==
X-Forwarded-Encrypted: i=1; AL+hErElYQESDHmYQeBDHeADidhe5m9al8IqCrVl7O9yGDQwGXB6pkF9SBjtQogFbyczdeWGyrOOX20=@lists.linux.dev
X-Gm-Message-State: APuU4Z/t2K4o83ROLeZPcOFdVScGLW/fJBU2XyBSMYua+xwGHZA48F5l
	o3hWPMKi5jIMxMD9cIGK+3axy9amsuXCtgjaCgeRZ2vY2uW0Cvck8qHHnad4cSOBL1Q=
X-Gm-Gg: AYBFou1ITkeMZDRkMWxxlDARaMpIB/enTfzgxQjLw+5yjYBX/lgy2AQkwSCnzNLM9i2
	ufwCZ0voKjTfhturBBMV//4mqGPIih+8+hJ8vWGa5M3CtEGwYjyGDNF+u65k3Q59qYVHiFNN43m
	jRwLwDxqYahcvKEswtYyubtpkbQ4F0hct65vzZv1wWDu8aiK6teo9vghBNqja/PnS4YMGQ6DBDg
	HVh2d3hnRwm7UgPsZ1NLwytOoOvXH1erTYVtLbWbPRvAHD48WDFHgIsIjlQASGgFFX8+0/2nxme
	exQHopyZyXDm158cNRAdi2wusBehGqtcvFkYPkXmXtbO683L66sEeTxLZNlwtvPkeEhWLYSO2o1
	VgiguG1btBXwcxuf0xsxbU+XneD6aFE3i+3kC6QR+6hOLbM/lRkg+zY+q3zf1hLsgXxG/xatkdO
	CMo1XMxxCukAwzmuERX8z04+LKvABw4yGh3+lMzlx4qSC0AXE0UAc0sOLaJRCVwSxHfdTEZeFiy
	nKzfT8Br372DNuJr9y4oRWOH4XzB0SrTe1diPytIZ4YEO/AgwiFUotF5gtZXFXVuM4GzVhDVU5o
	pYE7wGOMI0chA2kbzaz9G33ueP3x7drf
X-Received: by 2002:a05:600c:c11c:b0:4ba:4395:5755 with SMTP id 5b1f17b1804b1-4ba439563abmr31167145e9.5.1794411158644;
        Wed, 11 Nov 2026 07:32:38 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4c53bb94sm3822685e9.8.2026.11.11.07.32.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 07:32:38 -0800 (PST)
Date: Wed, 11 Nov 2026 16:32:36 +0100
From: Petr Mladek <pmladek@suse.com>
To: sashiko-reviews@lists.linux.dev
Cc: John Ogness <john.ogness@linutronix.de>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Marcos Paulo de Souza <mpdesouza@suse.com>,
	Chris Down <chris@chrisdown.name>,
	Naveen Kumar Chaudhary <naveen.osdev@gmail.com>,
	printk@lists.linux.dev
Subject: Re: [PATCH v6 08/16] printk: Ensure consistent name and devname when
 updating preferred console
Message-ID: <avSKlPchC04gjpky@pathway.suse.cz>
References: <20261106171952.207909-1-pmladek@suse.com>
 <20261106171952.207909-9-pmladek@suse.com>
 <sashiko-outbox-201951@kernel.org>
 <avHTsnRan9cALOEu@pathway.suse.cz>
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
In-Reply-To: <avHTsnRan9cALOEu@pathway.suse.cz>

On Mon 2026-11-09 15:07:46, Petr Mladek wrote:
> On Fri 2026-11-06 17:37:13, sashiko-bot@kernel.org wrote:
> > Thank you for your contribution! Sashiko AI review found 1 potential
> > issue to consider:
> > - [Low] printk: cross-type update corrupts entry in
> >   add_or_update_preferred_console()
> > --
> > 
> > commit dac2f22b5af57f05f13a7369b2af922602449749
> > Author: Petr Mladek <pmladek@suse.com>
> > 
> > printk: Ensure consistent name and devname when updating preferred console
> > 
> > This commit adds validation in add_or_update_preferred_console() to check
> > that existing preferred console entries match the provided devname or
> > name and index when updated.
> > 
> > > diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
> > > index 26fab79c32c4b..ba644a0650910 100644
> > > --- a/kernel/printk/printk.c
> > > +++ b/kernel/printk/printk.c
> > > @@ -2564,6 +2564,8 @@ asmlinkage __visible void early_printk(const char *fmt, ...)
> > >   *
> > >   *   2. Either @name and valid @idx OR @devname and @idx=-1 are allowed. [*]
> > >   *
> > > + *   3. Only matching entries can be updated.
> > > + *
> > >   *  [*] A valid @name and @idx will get assigned for a devname later when
> > >   *	@devname matches during the device initialization, see
> > >   *	match_devname_and_update_preferred_console().
> > > @@ -2589,10 +2591,7 @@ static int add_or_update_preferred_console(unsigned int i,
> > >  		return -EINVAL;
> > >  	}
> > >  
> > > -	if (!pc->name[0] && !pc->devname[0])
> > > -		is_new_entry = true;
> > > -
> > > -	if (is_new_entry && devname) {
> > > +	if (devname) {
> > >  		/*
> > >  		 * A valid console name and index will get assigned when
> > >  		 * a matching device gets registered.
> > > @@ -2608,11 +2607,18 @@ static int add_or_update_preferred_console(unsigned int i,
> > >  			return -EINVAL;
> > >  		}
> > >  
> > > -		strscpy(pc->devname, devname);
> > > -		pc->index = idx;
> > > +		if (!pc->devname[0]) {
> > > +			is_new_entry = true;
> > > +			strscpy(pc->devname, devname);
> > > +			pc->index = idx;
> > > +		} else if (strcmp(pc->devname, devname) != 0) {
> > > +			pr_err("Updating a preferred console with an invalid devname: %s vs. %s\n",
> > > +			       pc->devname, devname);
> > > +			return -EINVAL;
> > > +		}
> > >  	}
> > >  
> > > -	if (is_new_entry && name) {
> > > +	if (name) {
> > >  		/* A console name must be defined with a valid index. */
> > >  		if (idx < 0) {
> > >  			pr_err("Adding a preferred console with an invalid index: %s, %d\n",
> > > @@ -2620,8 +2626,15 @@ static int add_or_update_preferred_console(unsigned int i,
> > >  			return -EINVAL;
> > >  		}
> > >  
> > > -		strscpy(pc->name, name);
> > > -		pc->index = idx;
> > > +		if (!pc->name[0]) {
> > > +			is_new_entry = true;
> > > +			strscpy(pc->name, name);
> > > +			pc->index = idx;
> > > +		} else if (strcmp(pc->name, name) != 0 || pc->index != idx) {
> > > +			pr_err("Updating a preferred console with an invalid name or index: %s%d vs. %s%d\n",
> > > +			       pc->name, pc->index, name, idx);
> > > +			return -EINVAL;
> > > +		}
> > >  	}
> > 
> > [Severity: Low]
> > As reported by Chris Down on v5 [1], does replacing the combined
> > (!pc->name[0] && !pc->devname[0]) check with separate !pc->devname[0] and
> > !pc->name[0] checks allow a cross-type update on an occupied slot to
> > corrupt the entry instead of returning -EINVAL?
> > 
> > If preferred_consoles[i] was added by name (so pc->name[0] is set and
> > pc->devname[0] is empty) and add_or_update_preferred_console() is called
> > on that slot with a devname, !pc->devname[0] is true.  It treats the
> > existing entry as new, sets pc->index to -1 while pc->name remains set,
> > and overwrites pc->options and braille options.  The reverse also happens
> > when a name update hits an unresolved devname entry where !pc->name[0] is
> > still true.
> > 
> > Keeping is_new_entry = (!pc->name[0] && !pc->devname[0]) and checking
> > if (is_new_entry) before the strcmp() branches would reject both
> > mismatched updates with -EINVAL.
> > 
> > [1] https://lore.kernel.org/r/auLxQDWkHLV01D1t@chrisdown.name
> 
> This problem currently does not exist because there is only one
> caller in __add_preferred_console(). And it calls this function
> only when "name+idx" or "devname" matched. And only "name+idx"
> or "devname" could be defined.
> 
> Well, this patch is supposed to add paranoid checks to make sure
> that it is called correctly. So, we should catch these cross-update.
> I would add two more checks:
> 
> --- a/kernel/printk/printk.c
> +++ b/kernel/printk/printk.c
> @@ -2606,6 +2606,11 @@ static int add_or_update_preferred_console(unsigned int i,
>  			       devname, idx);
>  			return -EINVAL;
>  		}
> +		if (pc->name[0]) {
> +			pr_err("Updating a preferred console via devname when name is already assigned: %s, %d for %s%d\n",
> +			       devname, idx, pc->name, pc->index);

I thought more about it and this check looks to strict.
It might make sense to update the preferred_consoles[] entry
even when it was already used to register a console. For example,
someone might want to unregister the console and register it again
with another options.

> +			return -EINVAL;
> +		}
>  
>  		if (!pc->devname[0]) {
>  			is_new_entry = true;
> @@ -2625,6 +2630,15 @@ static int add_or_update_preferred_console(unsigned int i,
>  			       name, idx);
>  			return -EINVAL;
>  		}
> +		/*
> +		 * The name should get assinged when matching the devname, see
> +		 * match_devname_and_update_preferred_console().
> +		 */
> +		if (pc->devname[0]) {
> +			pr_err("Updating a preferred console via name when it was preferred via devname: %s%d for %s, %d\n",
> +			       name, idx, pc->devname, pc->index);
> +			return -EINVAL;

Same here.

> +		}
>  
>  		if (!pc->name[0]) {
>  			is_new_entry = true;

I am going to keep the check whether it is a new entry separate.
I mean the check:

	if (!pc->name[0] && !pc->devname[0])
		is_new_entry = true;

Sashiko should stop complaining that we miss cross-updates.
It seems that it even makes the code more straightforward.

Best Regards,
Petr
